# https://github.com/amazing-print/amazing_print#irb-integration
if defined?(AmazingPrint)
  require "amazing_print"
  AmazingPrint.irb!
end

# https://github.com/katsyoshi/irb-theme-dracula
require "irb/theme/dracula/dark"
