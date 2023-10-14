module Turbochat
    class UserStatus
      def self.update_statuses
        begin
          connection = ActiveRecord::Base.connection
          if connection.table_exists?('users') && connection.column_exists?('users', 'status')
            User.update_all(status: User.statuses[:offline])
          end
        rescue StandardError => e
          puts "User statuses not updated: #{e.message}"
        end
      end
    end
  end
  