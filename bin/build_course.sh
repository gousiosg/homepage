#!/usr/bin/env bash

usage() {
  echo "Usage: $0 [-o ] coursename material_path"
  exit 1
}

while getopts "o" arg; do
    case $arg in
        o)
            old=1
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z $1 ] || [ -z $2 ]; then
  usage
fi

copy_files() {
  cp $1/index.html $2
  find $1/lectures $1/assignments $1/notebooks -type f -name '*.html' | xargs -Istr cp str $2
  find $1/lectures $1/assignments $1/notebooks -type f -name '*.pdf' | xargs -Istr cp str $2
  find $1/lectures $1/assignments $1/notebooks -type f -name '*.ipynb'|grep -v ".ipynb_check" |xargs -Istr cp str $2
}

coursename=$1
material=$2
cwd=`pwd`

echo `date`: Building course $coursename from $material
echo `date`: Building branch: master to $cwd/courses/$coursename

cd $material || exit 1
make -j 12 html 1>/dev/null || exit 1
echo `date`: Copying files from `pwd` to $cwd/courses/$coursename
mkdir -p $cwd/courses/$coursename || exit 1
copy_files `pwd` $cwd/courses/$coursename

if [ ! -z $old ]; then
  cd $material || exit 1
  git fetch origin

  for branch in `git branch -r | grep -v "master" | cut -f2 -d'/'`; do
    echo `date`: Building branch $branch to $cwd/courses/$coursename/$branch

#    if [[ ! -z $(git status -s | grep -v "?? ") ]]; then
#      echo `date`: "Path $material has uncommitted changes"
#      exit 1
#    fi

    echo `date`: Checking out branch $branch
    git checkout -b $branch origin/$branch || exit 1

    make clean
    make -j 12 html 1>/dev/null || exit 1
    mkdir -p $cwd/courses/$coursename/$branch || exit 1

    echo `date`: Copying files from `pwd` to $cwd/courses/$branch
    copy_files `pwd` $cwd/courses/$coursename/$branch

    git checkout master
    git branch -d $branch || exit 1
  done
  cd $cwd
fi
