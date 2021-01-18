# random-video-player

## Guides

### Generate a medias.json file from anilist

```console
$ curl "https://api.openings.ninja/random/?source=anilist&username=$USERNAME&rank=100&status[]=completed&variant[]=op&variant[]=ed' --globoff -o curl.json
$ jq '[.[].theme | select(.nsfw | not) | .videos[] | select(.tags == "mp4") | .url]' > medias.json < curl.json
```
