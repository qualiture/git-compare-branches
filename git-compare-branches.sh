gitcompare() {
  echo

  if [[ -z $1 || -z $2 ]]; then
    echo -e "\033[1;33mFile $FILE does not exist!\033[0m You must bind the folder \033[1;37m./hana_spc_app/srv\033[0m to your reusable development"
  else
    REPO=$(git config --get remote.origin.url)
    SOURCE="$1"
    TARGET="$2"
    if [[ -z $REPO ]]; then
      echo -e "\033[1;33mNo repository found in current folder!\033[0m"
    else
      SOURCE_EXISTS=$(git ls-remote --heads "$REPO" refs/heads/"$SOURCE" | wc -l)

      if [[ $SOURCE_EXISTS -eq 1 ]]; then
        TARGET_EXISTS=$(git ls-remote --heads "$REPO" refs/heads/"$TARGET" | wc -l)

        if [[ $TARGET_EXISTS -eq 1 ]]; then
          echo -e "The below features are merged in \033[1;32m$SOURCE\033[0m but not yet merged in \033[1;32m$TARGET\033[0m:"
          echo -e "\033[1;95m"
          comm -12 <(sort <(git branch -r --no-merged origin/$TARGET)) <(sort <(git branch -r --merged origin/$SOURCE))
          echo -e "\033[1;0m"
        else 
          echo -e "\033[1;33mBranch $TARGET does not exist!\033[0m"
        fi
      else
        echo -e "\033[1;33mBranch $SOURCE does not exist!\033[0m"
      fi
    fi
  fi
}
