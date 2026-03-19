module "github_repository" {
  source  = "pagopa-dx/github-environment-bootstrap/github"
  version = "~> 1.0"

  repository = {
    name                   = "meetup-demo"
    description            = "A repository for live demo at DX meetups"
    topics                 = []
    reviewers_teams        = []
  }
}
