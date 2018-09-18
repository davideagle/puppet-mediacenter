node default {
  include ::mediacenter::cron::deploy
  include ::mediacenter::cron::run_mediacenter
  include ::mediacenter::kodi::setup
  include ::mediacenter::system::packages
  include ::mediacenter::system::services
  include ::mediacenter::sonarr::setup
  include ::mediacenter::radarr::setup
  include ::mediacenter::transmission::setup
  include ::mediacenter::jacket::setup
}
