+++ 
draft = true
date = 2021-02-19T16:25:04Z
title = "Gatsby to Hugo"
description = "Moving from Gatsby to Hugo in fell swoop!"
slug = "cam"
authors = []
tags = ["gatsby", "hugo" , "go" , "blog", "static"]
categories = []
externalLink = ""
series = []
+++

I recently decided that I would be moving my personal site from Gatsby to Hugo. I quite enjoyed using Gatbsy so I'm not moving due to poor experience but more that I have wanted to give Hugo a try for a while and figured this would be the best project to use it with.

Some cool features of Hugo
- It's written in Go! (No Golang programming knowledge required for creating sites with Hugo)
- It's lightning fast
- The list of available themes is Huge and you could also roll your own
  
### Starting the move 

My site is pretty small and so it shouldn't be too difficult to move. Both render posts form markdown so there's no need to do any converting.

### Setting up the Hugo site
#### Installation

```bash
brew install hugo
hugo version
```

If Hugo has installed correctly we should see the following output 
```bash
Hugo Static Site Generator v0.80.0/extended darwin/amd64 BuildDate: unknown
```

#### Create a new site

```bash
hugo new site hugo-blog
```

This will create a Hugo site in the current directory. 

#### Adding a theme

There's a huge selection of different themes available which can be found on the [themes webpage](https://themes.gohugo.io/). I have chosen to use the [hugo coder theme](https://github.com/luizdepra/hugo-coder)

To use the theme we need to download it and add it to the `themes` directory of our site. 

```bash
cd hugo-blog
git init 
git submodule add https://github.com/luizdepra/hugo-coder.git themes/hugo-coder
```
Now that our theme is in place we can add the following to a `config.toml` file at the root of our project.
```toml
baseurl = "https://www.cameronroberts.dev"
title = "Cameron Roberts"
theme = "hugo-coder"
languagecode = "en"
defaultcontentlanguage = "en"
paginate = 20

pygmentsstyle = "bw"
pygmentscodefences = true
pygmentscodefencesguesssyntax = true

[params]
  author = "Cameron Roberts"
  info = "Software Engineer enjoying all things Cloud and IoT"
  description = "Personal site"
  keywords = "blog,developer,personal"
  avatarurl = "images/icon.jpeg"
  
  footercontent = ""
  hideFooter = true
  hideCredits = true
  hideCopyright = true
  since = 2019

  enableTwemoji = true

  colorScheme = "auto"
  hidecolorschemetoggle = false
  
#  customCSS = ["css/style.css"]
#   customSCSS = ["scss/custom.scss"]
#   customJS = ["js/custom.js"]
[taxonomies]
  category = "categories"
  series = "series"
  tag = "tags"
  author = "authors"

# Social links
[[params.social]]
  name = "Github"
  icon = "fa fa-github fa-2x"
  weight = 1
  url = "https://github.com/cameronldroberts/"
[[params.social]]
  name = "Twitter"
  icon = "fa fa-twitter fa-2x"
  weight = 2
  url = "https://twitter.com/cameron_1010/"
# [[params.social]]
#     name = "LinkedIn"
#     icon = "fa fa-linkedin"
#     weight = 3
#     url = "https://www.linkedin.com/in/johndoe/"
[[params.social]]
    name = "Medium"
    icon = "fa fa-medium"
    weight = 4
    url = "https://medium.com/@cameronldroberts"
[[params.social]]
    name = "Devto"
    icon = "fa fa-dev-to"
    weight = 5
    url = "https://dev.to/cameronldroberts"

# Menu links
[[menu.main]]
  name = "About"
  weight = 1
  url = "about/"
  
[[menu.main]]
  name = "Blog"
  weight = 2
  url  = "posts/"
[[menu.main]]
  name = "Contact"
  weight = 3
  url  = "contact/"

```
You will need to change some values such as social links, avatarUrl, title and anything else that points to my site. 

#### Adding content

Now that we have the plumbing sorted we can start adding some content. If you have an old site you want to bring your content from then you can do that quite easily. The markdown files live in `content/posts` so you could just copy them over 

```bash
cp ~/dev/oldwebsite/content/* content/posts/
```
It's worth noting that if you are moving content and have also published this to somewhere like [dev.to](http://dev.to/) then your canonical URLs may need changing. 

On my Gatsby site the posts could be found under `/blog` like this
```
https://cameronroberts.dev/blog/consuming-restapi-golang/
```

whereas on the Hugo site they will be found under `/posts` like this 
```
https://cameronroberts.dev/posts/consuming-restapi-golang/
```
This is worth considering if you do have content posted on other sites. I will be doing a post on how we can cross post to other sites soon so stay tuned.

If you don't have any content to bring over then not to worry as we can quite easily create some 

```bash
hugo new posts/my-first-post.md
```

This will generate a file in the `content/posts` directory that looks like the following 
```
+++ 
draft = true
date = 2021-02-19T23:01:52Z
title = ""
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++
```

I'll leave you fill that in with whatever you want to write about. It can be anything for now, maybe some [Lorem Ipsum](https://www.lipsum.com/).

To summarise our progress so far we have 

- Installed Hugo
- Generated a Hugo site
- Added a theme to our site
- Copied over our old content/Added some new content


Now that we have completed these steps we can see our page in action! 

### Running our site locally 

To do this run the following command 

```bash
hugo serve -D
```

Hugo will spin up a webserver that builds and serves the site. By default live reload will be enabled which is a great feature as it allows us to see our changes nearly instantly. 

```bash

hugo-blog git:(main) ✗ hugo serve -D                  
Start building sites … 

                   | EN  
-------------------+-----
  Pages            | 48  
  Paginator pages  |  0  
  Non-page files   |  0  
  Static files     |  7  
  Processed images |  0  
  Aliases          | 18  
  Sitemaps         |  1  
  Cleaned          |  0  

Built in 138 ms
Watching for changes in /Users/cameronroberts/dev/hugo-blog/{archetypes,content,data,layouts,static,themes}
Watching for config changes in /Users/cameronroberts/dev/hugo-blog/config.toml
Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```

If all goes well then your console output should look something like the output above. At this point we can navigate to `http://localhost:1313/` and see our site. There may need to be a few tweaks here and there where the content is referencing myself or socials. You may have missed something in the `config.toml` if so but a quick find+replace will do the trick. 

### Push to Github

Now that we have an early version of our site ready it is worth checking this into Github as we can version control and it will be required for the next steps where we deploy our site to Netlify. The steps to do this are as follows 

```bash
git init
git add -A
git commit -m "first commit"
git branch -M main
git remote add origin 
git remote add origin https://github.com/cameronldroberts/hugo-blog.git
git push -u origin main
```

Github usually provides you with the steps when you create a new repo but I'll include them incase you can't find them. If you follow the steps above make sure you change the remote origin to your repository. Be sure to know what you're committing into your repository when using `git add -A` as you could quite easily check in an API key or sensitive information when using it (should be fine for our first drop of code with the blog). I usually use the VSCode Source control tab as it gives a nice way to compare changes. 

### Deploying to Netlify 

My original Gatsby site was deployed to Netlify and I decided to stick with the platform as it just makes it all so easy. We are going to use Github as this is where I host my code but it is possible to use others such as Bitbucket and GitLab although the steps may deviate slightly. 

If you haven't already got a Netlify account you can sign up [here](https://app.netlify.com/). This will ask you to authorize with Github as it will require access to the repo you want to deploy.

Once you have authorized Netlify navigate to the "sites" page and click the `New site from Git` button. This will popup a wizard for you to follow to create a new website referencing a Github repo of your choice. Pick the repository that you just pushed your site to. I chose hugo-blog as this is where I pushed my code. The next page will ask for a few bits of information such as Owner and Branch which are usually auto populated with the correct values. In my project they are `cameronldroberts's team` and `main`. For the `Basic build settings` you have two options 

option 1) Fill out the required information with your required build command `hugo` and publish directory `public`. Depending on the theme used you may need to specify a minimum version build command

option 2) This is the method I have used and would recommend as it doesn't take much extra effort and everything is all together nicely in your source control. Create the following file in the root of your Github repo in a file called `netlify.toml`
```toml
[build]
publish = "public"
command = "hugo --gc --minify"

[context.production.environment]
HUGO_VERSION = "0.81.0"
HUGO_ENV = "production"
HUGO_ENABLEGITINFO = "true"

[context.split1]
command = "hugo --gc --minify --enableGitInfo"

[context.split1.environment]
HUGO_VERSION = "0.81.0"
HUGO_ENV = "production"

[context.deploy-preview]
command = "hugo --gc --minify --buildFuture -b $DEPLOY_PRIME_URL"

[context.deploy-preview.environment]
HUGO_VERSION = "0.81.0"

[context.branch-deploy]
command = "hugo --gc --minify -b $DEPLOY_PRIME_URL"

[context.branch-deploy.environment]
HUGO_VERSION = "0.81.0"

[context.next.environment]
HUGO_ENABLEGITINFO = "true"
```

Just before we deploy our site we need to check this into Github quickly. 
```bash
git add netlify.toml
git commit -m "Add Netlify config"
git push
```
Once the config file has reached our Github repo hit `Deploy site`. Netlify will take a few minutes whilst it gets the site deployed but once it has you should get a site link on your `Site overview` page. Visit the page and tadaah you have deployed your site to Netlify and the world can see.

#### Some debugging tips if it doesn't quite go to plan 

- Check the Netlify logs it will usually point out the errors it is struggling with
- If you chose option 1 and didn't use the netlify config file then make sure you are using at least the minimum version of Hugo that your theme requires

### Custom domain
Whilst the urls generated by Netlify are completely free and great whilst in dev, if you're creating a proper site I would imagine that you would like to add your own. You can buy a domain through Netlify and by doing this they will configure DNS and provision a wildcard certificate. I bought my domain prior to making the original site so never got one through Netlify. I can imagine this would be the easiest way to add a custom domain to a Netlify site but it isn't too difficult to do so when your domain is purchased elsewhere. You also have the option to use the Netlify DNS and let them handle everything. I think this may be slightly out of scope for this post but if you want to read up on how you can do it then [this document is good place to start](https://docs.netlify.com/domains-https/custom-domains/configure-external-dns/)

If you don't mind a domain that ends with `netlify.app` then you can change the randomly generated name to something more suitable. Head over to `Site settings -> Domain Management` and hit click on the `options` drop down under Custom domains.

### web.dev/measure
Google have provided a pretty cool site which you can use to measure overall performance of your site. I ran both sites through the tool and got the following reports
**Hugo**
Performance - 99
Accessibility - 100
Best practices - 100
SEO - 100

**Gatsby**
Performance - 92
Accessibility - 97
Best practices - 100
SEO - 100

According to the tool the Hugo site outperforms the Gatsby one. In defense of the Gatsby site there's a few bits of code in there that I have written to test things out and never finished to it may not be completely fair race. Having said that the Gatsby site despite being slightly neglected is not performing too badly.

#### Reading list
- https://gohugo.io/hosting-and-deployment/hosting-on-netlify/
- https://gohugo.io/getting-started/quick-start/
