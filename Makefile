# Load configuration from _config.yml
# This requires a simple YAML parser, using shell commands for basic extraction

# Extract values from _config.yml
SCHOLAR_SOURCE := $(shell grep "source:" _config.yml | awk '{print $$2}')
SCHOLAR_BIBDIR := $(shell grep "bibdir:" _config.yml | awk '{print $$2}')
SCHOLAR_BIBLIOGRAPHY := $(shell grep "bibliography:" _config.yml | awk '{print $$2}')

# Extract courses from _config.yml
# Format is: coursename: path
# COURSES := $(shell grep -A 10 "courses:" _config.yml | grep -v "courses:" | grep -v "#" | grep -v "^$$" | sed 's/^\s*//g' | cut -d':' -f1,2)

# Default target
.PHONY: all bib courses clean

all: bib courses
	@echo "Building dependencies"

# Generate bibliography file
bib:
	@echo "Generating bibliography file"
	@mkdir -p $(SCHOLAR_SOURCE)
	@rm -f $(SCHOLAR_SOURCE)/$(SCHOLAR_BIBLIOGRAPHY)
	@for bibfile in $(shell find $(SCHOLAR_BIBDIR) -name "*.bib"); do \
		echo "Copying $$bibfile -> $(SCHOLAR_SOURCE)"; \
		cp $$bibfile $(SCHOLAR_SOURCE); \
		cat $$bibfile >> $(SCHOLAR_SOURCE)/$(SCHOLAR_BIBLIOGRAPHY); \
	done

# Prepare course slides
courses:
	@echo "Building course slides"
	@for course in $(COURSES); do \
		name=$$(echo $$course | cut -d':' -f1); \
		path=$$(echo $$course | cut -d':' -f2 | sed 's/^ //g'); \
		echo "Building course: $$name from $$path"; \
		./bin/build_course.sh $$name $$path; \
	done

# Clean up
clean:
	@echo "Cleaning up"
	@rm -rf _site
	@rm -rf courses/atse
	@rm -f $(SCHOLAR_BIBLIOGRAPHY)