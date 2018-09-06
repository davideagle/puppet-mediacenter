node default {
  include ::mediacenter::kodi::setup
  include ::mediacenter::system::packages
  include ::mediacenter::system::services
}
