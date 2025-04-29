server_files=(.local .config .cache scripts .bash_aliases .gitconfig .gitignore .netrc .vimrc setup.sh)

# rsync -avuz --progress ./ $1:~/

for file in ${server_files[@]}; do
    rsync -avuz --progress --exclude ".DS_Store" $file $1:~/
done

ssh $1 "cd ~/; chmod +x ~/setup.sh; ~/setup.sh"
