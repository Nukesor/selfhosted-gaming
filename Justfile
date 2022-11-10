run:
    zola serve

build:
    zola build

watch:
    watchexec -w ./content -r "zola serve"
