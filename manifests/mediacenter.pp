node default {
  include ::mediacenter::kodi::setup
  include ::mediacenter::system::packages.pp
  include ::mediacenter::system::services.pp
}
