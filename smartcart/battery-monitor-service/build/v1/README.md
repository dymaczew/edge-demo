# Simple NodeJS application

This is a simple application that will respond to a CURL request with a pair of random words separated with a `-`character.

## Build and Run

The `build.sh` script will cleanup, build and run the NodeJS application and if all is well, then the `curl` command at the end of the script will return a random pair of words as in the example below. In this case `battle-depth`

```
macbook:faststart rhine$ ./build.sh
*INFO* finding and removing any previous instances
6136aac57c11
6136aac57c11
Untagged: rhine/edge2020:latest
Deleted: sha256:0867baadc828d6fa931012dac29de280749e9173c723e6e0df145f5ad42ec129
Deleted: sha256:726f89d2dce2421ecd2098d6f0a2b9066825bf338ec1c82f2eaf444ba3953d97
Deleted: sha256:040a8a8cff3cf0c0b89ad28d07ecbc8d718540e385a8c1909d2cdd7668065e66
Deleted: sha256:976b5f8eb5301a45bca0ae4fccd6bb4fe85b7e324a2ea48d044d29be8f2e5138
Deleted: sha256:4f45f19a0c3944c85455d86053295bf03456374942792f1398c1906b8486780c
Deleted: sha256:88069352adc341fb3ecc564394ee3278e323a61c74b79cfdd6516ca30d871534
Deleted: sha256:68bbebcf286eae325e2d1228e13c86e4263f6586afb8edd2a2b64680d7e11363
Deleted: sha256:5f5243da7bc1e0b332179303a119cd86c5f067db1cd4aececa14803750a64323
*INFO* building a new NodeJS container image
Sending build context to Docker daemon  22.53kB
Step 1/7 : FROM node:10
 ---> ea119cebc1c3
Step 2/7 : WORKDIR /usr/src/app
 ---> Using cache
 ---> 593e0ba8a52f
Step 3/7 : COPY package*.json ./
 ---> a63701344da7
Step 4/7 : RUN npm install
 ---> Running in 6e15a4631c79
npm WARN faststart@1.0.0 No repository field.
npm WARN faststart@1.0.0 No license field.

added 51 packages from 38 contributors and audited 127 packages in 1.693s
found 0 vulnerabilities

Removing intermediate container 6e15a4631c79
 ---> ed90d30fdf05
Step 5/7 : COPY . .
 ---> f5dd57ba51e8
Step 6/7 : EXPOSE 8080
 ---> Running in 016caee09797
Removing intermediate container 016caee09797
 ---> 3a1863a2129c
Step 7/7 : CMD [ "node", "server.js" ]
 ---> Running in 0099dee48536
Removing intermediate container 0099dee48536
 ---> 3d233a27f246
Successfully built 3d233a27f246
Successfully tagged rhine/edge2020:latest
*INFO* running our new image and exposing service on port 2020
cf8a86de49d1cd3ddc314415afbeb98b7b713fc0caa52cc74fb7b8f5b51ede8d
*INFO* waiting 5 seconds for the NodeJS server to initialise
*INFO* look at the application logs
Welcome to Faststart 2020 - running on http://0.0.0.0:8080
*INFO* send a request to the server
HTTP/1.1 200 OK
X-Powered-By: Express
Content-Type: text/html; charset=utf-8
Content-Length: 13
ETag: W/"d-lRcXHzo6gdXIAfkRP0iukv/TC2M"
Date: Fri, 03 Jan 2020 15:00:06 GMT
Connection: keep-alive

battle-depth
```
The application is designed to respond to a simple web request and prove that it is alive by returning different strings each time it is invoked.

See `exercise.sh`

and some sample output ...

```
macbook:faststart rhine$ ./exercise.sh
*INFO* Sending 5 requests to our randowm word generator
HTTP/1.1 200 OK
X-Powered-By: Express
Content-Type: text/html; charset=utf-8
Content-Length: 13
ETag: W/"d-h3tUvg3m2F9Nj3yNJ7XGj2GOBew"
Date: Fri, 03 Jan 2020 15:12:33 GMT
Connection: keep-alive

want-western
HTTP/1.1 200 OK
X-Powered-By: Express
Content-Type: text/html; charset=utf-8
Content-Length: 10
ETag: W/"a-PIyhFNkAOEu0XyHjMXs2D1RtgNk"
Date: Fri, 03 Jan 2020 15:12:33 GMT
Connection: keep-alive

bear-gate
HTTP/1.1 200 OK
X-Powered-By: Express
Content-Type: text/html; charset=utf-8
Content-Length: 16
ETag: W/"10-VHJr6s2bCpLgWYUiik0tn+tz7oI"
Date: Fri, 03 Jan 2020 15:12:33 GMT
Connection: keep-alive

certainly-music
HTTP/1.1 200 OK
X-Powered-By: Express
Content-Type: text/html; charset=utf-8
Content-Length: 14
ETag: W/"e-BpPrKRrqnXcNlIEWaQLWOMIgc+c"
Date: Fri, 03 Jan 2020 15:12:33 GMT
Connection: keep-alive

guess-central
HTTP/1.1 200 OK
X-Powered-By: Express
Content-Type: text/html; charset=utf-8
Content-Length: 11
ETag: W/"b-NAMXVviD9W5o30kHUWdy9Jfir24"
Date: Fri, 03 Jan 2020 15:12:33 GMT
Connection: keep-alive

lack-tales
*INFO* Done!
```
