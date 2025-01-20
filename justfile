help_msg:='''
Make sure to run the following command once after you clone the repo:
\`just setup\`

'''

default:
    @echo "{{help_msg}}"
    @just --list

setup:
    git submodule init
    git submodule update
    ls git_hooks/ | xargs -I{} cp git_hooks/{} .git/hooks/

new name:
    mkdir -p content/posts/'{{name}}'/
    cp pages/front_matter.md content/posts/'{{name}}'/index.md

check:
    @zola check --drafts

draft:
    zola serve --drafts

serve:
    zola serve

update_theme:
    git submodule update --recursive --remote
