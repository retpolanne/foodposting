resource "cloudflare_account" "retpolanne" {
  name = "retpolanne"
}

resource "cloudflare_zone" "retpolannedotcom" {
  account_id = cloudflare_account.retpolanne.id
  zone       = "retpolanne.com"
}

resource "cloudflare_record" "foodposting" {
  zone_id = cloudflare_zone.retpolannedotcom.id
  name    = "foodposting"
  value   = "retpolanne.github.io."
  type    = "CNAME"
}

resource "github_repository" "foodpostingretpolannedotcom" {
  name        = "foodposting.retpolanne.com"
  description = "My website"
  private      = false

  pages {
    cname = "foodposting.retpolanne.com"
    build_type = "workflow"
  }
}
