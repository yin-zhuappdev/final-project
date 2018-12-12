class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :setup_penalty

  def setup_penalty
    #need to add all other states in addition to CA and NY
    @fed_age_penalty = {20 => 0.635, 21 => 1, 22 => 1, 23 => 1, 24 => 1, 25 => 1.004, 26 => 1.024, 27 => 1.048, 28 => 1.087, 29 => 1.119, 30 => 1.135, 31 => 1.159, 32 => 1.183, 33 => 1.198, 34 => 1.214, 35 => 1.222, 36 => 1.23, 37 => 1.238, 38 => 1.246, 39 => 1.262, 40 => 1.278, 41 => 1.302, 42 => 1.325, 43 => 1.357, 44 => 1.397, 45 => 1.444, 46 => 1.5, 47 => 1.563, 48 => 1.635, 49 => 1.706, 50 => 1.786, 51 => 1.865, 52 => 1.952, 53 => 2.04, 54 => 2.135, 55 => 2.23, 56 => 2.333, 57 => 2.437, 58 => 2.548, 59 => 2.603, 60 => 2.714, 61 => 2.81, 62 => 2.873, 63 => 2.952, 64 => 3}
    @ny_age_penalty = {20 => 1, 21 => 1, 22 => 1, 23 => 1, 24 => 1, 25 => 1, 26 => 1, 27 => 1, 28 => 1, 29 => 1, 30 => 1, 31 => 1, 32 => 1, 33 => 1, 34 => 1, 35 => 1, 36 => 1, 37 => 1, 38 => 1, 39 => 1, 40 => 1, 41 => 1, 42 => 1, 43 => 1, 44 => 1, 45 => 1, 46 => 1, 47 => 1, 48 => 1, 49 => 1, 50 => 1, 51 => 1, 52 => 1, 53 => 1, 54 => 1, 55 => 1, 56 => 1, 57 => 1, 58 => 1, 59 => 1, 60 => 1, 61 => 1, 62 => 1, 63 => 1, 64 => 1}
    @vt_age_penalty = {20 => 1, 21 => 1, 22 => 1, 23 => 1, 24 => 1, 25 => 1, 26 => 1, 27 => 1, 28 => 1, 29 => 1, 30 => 1, 31 => 1, 32 => 1, 33 => 1, 34 => 1, 35 => 1, 36 => 1, 37 => 1, 38 => 1, 39 => 1, 40 => 1, 41 => 1, 42 => 1, 43 => 1, 44 => 1, 45 => 1, 46 => 1, 47 => 1, 48 => 1, 49 => 1, 50 => 1, 51 => 1, 52 => 1, 53 => 1, 54 => 1, 55 => 1, 56 => 1, 57 => 1, 58 => 1, 59 => 1, 60 => 1, 61 => 1, 62 => 1, 63 => 1, 64 => 1}
    @ut_age_penalty = {20 => 0.79, 21 => 1, 22 => 1.05, 23 => 1.113, 24 => 1.191, 25 => 1.298, 26 => 1.363, 27 => 1.39, 28 => 1.39, 29 => 1.39, 30 => 1.39, 31 => 1.39, 32 => 1.39, 33 => 1.39, 34 => 1.39, 35 => 1.39, 36 => 1.39, 37 => 1.404, 38 => 1.425, 39 => 1.45, 40 => 1.479, 41 => 1.516, 42 => 1.562, 43 => 1.616, 44 => 1.681, 45 => 1.748, 46 => 1.818, 47 => 1.891, 48 => 1.933, 49 => 2.045, 50 => 2.127, 51 => 2.212, 52 => 2.3, 53 => 2.392, 54 => 2.488, 55 => 2.588, 56 => 2.671, 57 => 2.799, 58 => 2.911, 59 => 3, 60 => 3, 61 => 3, 62 => 3, 63 => 3, 64 => 3}
    @mn_age_penalty = {20 => 0.89, 21 => 1, 22 => 1, 23 => 1, 24 => 1, 25 => 1.004, 26 => 1.024, 27 => 1.048, 28 => 1.087, 29 => 1.119, 30 => 1.135, 31 => 1.159, 32 => 1.183, 33 => 1.198, 34 => 1.214, 35 => 1.222, 36 => 1.23, 37 => 1.238, 38 => 1.246, 39 => 1.262, 40 => 1.278, 41 => 1.302, 42 => 1.325, 43 => 1.357, 44 => 1.397, 45 => 1.444, 46 => 1.5, 47 => 1.563, 48 => 1.635, 49 => 1.706, 50 => 1.786, 51 => 1.865, 52 => 1.952, 53 => 2.04, 54 => 2.135, 55 => 2.23, 56 => 2.333, 57 => 2.437, 58 => 2.548, 59 => 2.603, 60 => 2.714, 61 => 2.81, 62 => 2.873, 63 => 2.952, 64 => 3}
    @ma_age_penalty = {20 => 0.751, 21 => 1.183, 22 => 1.183, 23 => 1.183, 24 => 1.183, 25 => 1.183, 26 => 1.183, 27 => 1.22, 28 => 1.25, 29 => 1.275, 30 => 1.287, 31 => 1.305, 32 => 1.323, 33 => 1.334, 34 => 1.346, 35 => 1.352, 36 => 1.358, 37 => 1.363, 38 => 1.369, 39 => 1.381, 40 => 1.393, 41 => 1.41, 42 => 1.427, 43 => 1.45, 44 => 1.478, 45 => 1.511, 46 => 1.55, 47 => 1.593, 48 => 1.641, 49 => 1.688, 50 => 1.741, 51 => 1.792, 52 => 1.847, 53 => 1.902, 54 => 1.961, 55 => 2.019, 56 => 2.08, 57 => 2.142, 58 => 2.206, 59 => 2.28, 60 => 2.365, 61 => 2.365, 62 => 2.365, 63 => 2.365, 64 => 2.365}
    @nj_age_penalty = {20 => 0.97, 21 => 1.25, 22 => 1.25, 23 => 1.25, 24 => 1.25, 25 => 1.25, 26 => 1.25, 27 => 1.25, 28 => 1.25, 29 => 1.275, 30 => 1.287, 31 => 1.305, 32 => 1.323, 33 => 1.334, 34 => 1.346, 35 => 1.352, 36 => 1.358, 37 => 1.363, 38 => 1.369, 39 => 1.381, 40 => 1.393, 41 => 1.41, 42 => 1.427, 43 => 1.45, 44 => 1.478, 45 => 1.511, 46 => 1.55, 47 => 1.593, 48 => 1.641, 49 => 1.688, 50 => 1.741, 51 => 1.792, 52 => 1.847, 53 => 1.902, 54 => 1.961, 55 => 2.019, 56 => 2.08, 57 => 2.142, 58 => 2.206, 59 => 2.28, 60 => 2.28, 61 => 2.28, 62 => 2.28, 63 => 2.28, 64 => 2.28}
    @fed_smoker_penalty = {TRUE => 1.5, FALSE => 1}
    @ar_smoker_penalty = {TRUE => 1.2, FALSE => 1}
    @ca_smoker_penalty = {TRUE => 1, FALSE => 1}
    @co_smoker_penalty = {TRUE => 1.15, FALSE => 1}
    @ct_smoker_penalty = {TRUE => 1, FALSE => 1}
    @ky_smoker_penalty = {TRUE => 1.4, FALSE => 1}
    @ma_smoker_penalty = {TRUE => 1, FALSE => 1}
    @nj_smoker_penalty = {TRUE => 1, FALSE => 1}
    @ny_smoker_penalty = {TRUE => 1, FALSE => 1}
    @nc_smoker_penalty = {TRUE => 1.2, FALSE => 1}
    @or_smoker_penalty = {TRUE => 1.5, FALSE => 1}
    @ri_smoker_penalty = {TRUE => 1, FALSE => 1}
    @vt_smoker_penalty = {TRUE => 1, FALSE => 1}
    @al_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @ak_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @az_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @ar_table = {:smoker => @ar_smoker_penalty, :age => @fed_age_penalty}
    @ca_table = {:smoker => @ca_smoker_penalty, :age => @fed_age_penalty}
    @co_table = {:smoker => @co_smoker_penalty, :age => @fed_age_penalty}
    @ct_table = {:smoker => @co_smoker_penalty, :age => @fed_age_penalty}
    @de_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @fl_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @ga_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @hi_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @id_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @il_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @in_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @ia_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @ks_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @ky_table = {:smoker => @ky_smoker_penalty, :age => @fed_age_penalty}
    @la_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @me_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @md_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @ma_table = {:smoker => @ma_smoker_penalty, :age => @ma_age_penalty}
    @mi_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @mn_table = {:smoker => @fed_smoker_penalty, :age => @mn_age_penalty}
    @ms_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @mo_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @mt_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @ne_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @nv_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @nh_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @nj_table = {:smoker => @nj_smoker_penalty, :age => @nj_age_penalty}
    @nm_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @ny_table = {:smoker => @ny_smoker_penalty, :age => @ny_age_penalty}
    @nc_table = {:smoker => @nc_smoker_penalty, :age => @fed_age_penalty}
    @nd_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @oh_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @ok_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @or_table = {:smoker => @or_smoker_penalty, :age => @fed_age_penalty}
    @pa_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @ri_table = {:smoker => @ri_smoker_penalty, :age => @fed_age_penalty}
    @sc_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @sd_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @tn_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @tx_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @ut_table = {:smoker => @fed_smoker_penalty, :age => @ut_age_penalty}
    @vt_table = {:smoker => @vt_smoker_penalty, :age => @vt_age_penalty}
    @va_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @wa_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @wv_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @wi_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @wy_table = {:smoker => @fed_smoker_penalty, :age => @fed_age_penalty}
    @penalty_table = {:AL => @al_table, :AK => @ak_table, :AZ => @az_table, :AR => @ar_table, :CA => @ca_table, :CO => @co_table, :CT => @ct_table, :DE => @de_table, :FL => @fl_table, :GA => @ga_table, :HI => @hi_table, :ID => @id_table, :IL => @il_table, :IN => @in_table, :IA => @ia_table, :KS => @ks_table, :KY => @ky_table, :LA => @la_table, :ME => @me_table, :MD => @md_table, :MA => @ma_table, :MI => @mi_table, :MN => @mn_table, :MS => @ms_table, :MO => @mo_table, :MT => @mt_table, :NE => @ne_table, :NV => @nv_table, :NH => @nh_table, :NJ => @nj_table, :NM => @nm_table, :NY => @ny_table, :NC => @nc_table, :ND => @nd_table, :OH => @oh_table, :OK => @ok_table, :OR => @or_table, :PA => @pa_table, :RI => @ri_table, :SC => @sc_table, :SD => @sd_table, :TN => @tn_table, :TX => @tx_table, :UT => @ut_table, :VT => @vt_table, :VA => @va_table, :WA => @wa_table, :WV => @wv_table, :WI => @wi_table, :WY => @wy_table}
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:user_name, :birthday, :state, :tobacco_use, :estimated_cost])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:user_name, :birthday, :state, :tobacco_use, :estimated_cost])
  end

  skip_before_action :verify_authenticity_token, raise: false
end
