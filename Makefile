# Makefile equivalent to the Rakefile
# Load configuration from _config.yml using yq YAML processor

# Extract values from _config.yml using yq
SCHOLAR_SOURCE := $(shell yq '.scholar.source' _config.yml)
SCHOLAR_BIBDIR := $(shell yq '.scholar.bibdir' _config.yml)
SCHOLAR_BIBLIOGRAPHY := $(shell yq '.scholar.bibliography' _config.yml)

# Extract courses from _config.yml
# Create a temporary file with course entries
COURSE_LIST := $(shell yq '.courses | to_entries | .[] | .key + ":" + .value' _config.yml)

# Default target
.PHONY: check_deps all bib courses clean

all: build

# Check for dependencies
check_deps:
	@echo "Checking dependencies..."
	@which yq > /dev/null 2>&1 || (echo "yq not found. Installing with Homebrew..." && brew install yq)
	@echo "All dependencies are installed."
	# check if docker is installed
	@which docker > /dev/null 2>&1 || (echo "docker not found. Please install docker and try again." && exit 1)
	@echo "All dependencies are installed."

# Generate bibliography file
bib: check_deps
	@echo "Generating bibliography file"
	@mkdir -p $(SCHOLAR_SOURCE)
	@rm -f $(SCHOLAR_SOURCE)/$(SCHOLAR_BIBLIOGRAPHY)
	@for bibfile in $$(find $(SCHOLAR_BIBDIR) -name "*.bib"); do \
		echo "Copying $$bibfile -> $(SCHOLAR_SOURCE)"; \
		cp $$bibfile $(SCHOLAR_SOURCE); \
		cat $$bibfile >> $(SCHOLAR_SOURCE)/$(SCHOLAR_BIBLIOGRAPHY); \
	done

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
build: check_deps bib #courses
	@echo "Building the website"
	@docker run -v $(shell pwd):/site gousiosg/website

web: build
	# run python3 -m http.server 8000 on _site
	@python3 -m http.server 8000 -d _site
# Clean up
clean:
	@echo "Cleaning up"
	@rm -rf _site
	@rm -rf courses/atse
	@rm -f $(SCHOLAR_BIBLIOGRAPHY)
	@find . -name "*~" -delete
