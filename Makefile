# Makefile equivalent to the Rakefile
# Load configuration from _config.yml using yq YAML processor

# Extract values from _config.yml using yq
SCHOLAR_SOURCE := $(shell yq '.scholar.source' _config.yml)
SCHOLAR_BIBDIR := $(shell yq '.scholar.bibdir' _config.yml)
SCHOLAR_BIBLIOGRAPHY := $(shell yq '.scholar.bibliography' _config.yml)

# Find all source bib files and derive target paths
BIB_SOURCES := $(wildcard $(SCHOLAR_BIBDIR)/*.bib)
BIB_TARGETS := $(patsubst $(SCHOLAR_BIBDIR)/%.bib,$(SCHOLAR_SOURCE)/%.bib,$(BIB_SOURCES))

# Extract courses from _config.yml
# Create a temporary file with course entries
COURSE_LIST := $(shell yq '.courses | to_entries | .[] | .key + ":" + .value' _config.yml)

# Default target
.PHONY: check_deps all courses clean docker-build build web deploy

all: build

# Check for dependencies
check_deps:
	@echo "Checking dependencies..."
	@which yq > /dev/null 2>&1 || (echo "yq not found. Installing with Homebrew..." && brew install yq)
	@which docker > /dev/null 2>&1 || (echo "docker not found. Please install docker and try again." && exit 1)
	@which firebase > /dev/null 2>&1 || (echo "firebase not found. Install with: npm install -g firebase-tools" && exit 1)
	@echo "All dependencies are installed."

# Generate combined bibliography file (only when sources change)
$(SCHOLAR_SOURCE)/$(SCHOLAR_BIBLIOGRAPHY): $(BIB_SOURCES) | $(SCHOLAR_SOURCE)
	@echo "Generating combined bibliography file"
	@cat $^ > $@

# Copy individual bib files (only when source is newer)
$(SCHOLAR_SOURCE)/%.bib: $(SCHOLAR_BIBDIR)/%.bib | $(SCHOLAR_SOURCE)
	@echo "Copying $< -> $@"
	@cp $< $@

# Create bibliography directory
$(SCHOLAR_SOURCE):
	@mkdir -p $@

# Convenience target for bibliography
bib: $(SCHOLAR_SOURCE)/$(SCHOLAR_BIBLIOGRAPHY) $(BIB_TARGETS)

# Prepare course slides
courses:
	@echo "Building course slides"
	@for course_entry in $(COURSE_LIST); do \
		name=$$(echo $$course_entry | cut -d':' -f1); \
		path=$$(echo $$course_entry | cut -d':' -f2); \
		echo "Building course: $$name from $$path"; \
		./bin/build_course.sh $$name $$path; \
	done

# Build docker image
docker-build: check_deps bib #courses
	@echo "Building the docker image"
	@docker build -t gousiosg/website .

# Build the website
build: docker-build check_deps bib #courses
	@echo "Building the website"
	@docker run -v $(shell pwd):/site gousiosg/website

# Deploy to Firebase
deploy: build
	@echo "Deploying website to Firebase..."
	@firebase deploy

# Clean up
clean:
	@echo "Cleaning up"
	@rm -rf _site
	@rm -rf courses/atse
	@rm -f $(SCHOLAR_SOURCE)/$(SCHOLAR_BIBLIOGRAPHY)
	@find . -name "*~" -delete
