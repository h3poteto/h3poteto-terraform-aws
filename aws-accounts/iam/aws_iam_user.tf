resource "aws_iam_user" "circleci" {
  name = "CircleCI"
  path = "/"
}

resource "aws_iam_user" "github_actions" {
  name = "GitHubActions"
  path = "/"
}
