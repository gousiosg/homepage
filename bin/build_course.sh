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

function copy_files() {
  cp $1/index.html $2
  find $1/lectures $1/assignments $1/notebooks -type f -name '*.html' | xargs -Istr cp str $2
  find $1/lectures $1/assignments $1/notebooks -type f -name '*.pdf' | xargs -Istr cp str $2
  find $1/lectures $1/assignments $1/notebooks -type f -name '*.ipynb'|grep -v ".ipynb_check" |xargs -Istr cp str $2
}

function cleanup {
  if [ -e .stashed ]; then
    wd=`pwd`
    cd $material || exit 1
    git stash pop || exit 1
    rm .stashed || exit 1
    cd $wd
    echo $0 `date`: "Restored modified content"
  fi
}

coursename=$1
material=$2
cwd=`pwd`

echo $0 `date`: Building course $coursename from $material
echo  $0 `date`: Building branch: master to $cwd/courses/$coursename
cd $material || exit 1

make -j 12 html 1>/dev/null || exit 1
echo $0 `date`: Copying files from `pwd` to $cwd/courses/$coursename
mkdir -p $cwd/courses/$coursename || exit 1
copy_files `pwd` $cwd/courses/$coursename

if [ ! -z $old ]; then
  cd $material || exit 1
  git fetch origin

  for branch in `git branch -r | grep -v "master" | cut -f2 -d'/'`; do
    echo $0 `date`: Building branch $branch to $cwd/courses/$coursename/$branch

    # Check if there is uncommitted content in the directory
    if [[ ! -z $(git status -s | grep -v "?? ") ]]; then
      echo $0 `date`: "Path $material has uncommitted changes"
      git stash && touch .stashed
      echo $0 `date`: "Path $material, changes stashed"
      trap cleanup EXIT
    fi

    echo $0 `date`: Checking out branch $branch

    if [ -z `git branch | grep $branch`  ]; then
      git checkout -b $branch origin/$branch || exit 1
    else
      git checkout $branch || exit 1
    fi

    make clean
    make -j 12 html 1>/dev/null || exit 1
    mkdir -p $cwd/courses/$coursename/$branch || exit 1

    echo $0 `date`: Copying files from `pwd` to $cwd/courses/$branch
    copy_files `pwd` $cwd/courses/$coursename/$branch

    git checkout master
    git branch -d $branch || exit 1
  done
  cd $cwd
fi
