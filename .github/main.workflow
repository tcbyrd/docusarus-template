workflow "Docusaurus deploy" {
  on = "push"
  resolves = ["GitHub Pages Deploy"]
}

action "GitHub Pages Deploy" {
  uses = "maxheld83/ghpages@v0.2.1"
  needs = ["Build site"]
  secrets = ["GITHUB_TOKEN"]
  env = {
    BUILD_DIR = "website/build"
  }
}

action "Build site" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "ci --prefix website && npm run build --prefix website"
}
