default['thebeautyst']['user'] = 'thebeautyst'
default['thebeautyst']['group'] = 'www-data'

include_attribute 'test-cookbook::database'
include_attribute 'test-cookbook::nginx'