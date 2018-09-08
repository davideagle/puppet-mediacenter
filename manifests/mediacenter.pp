node default {
  include ::mediacenter::cron::deploy
  include ::mediacenter::cron::run_mediacenter
  include ::mediacenter::kodi::setup
  include ::mediacenter::system::packages
  include ::mediacenter::system::services
}
