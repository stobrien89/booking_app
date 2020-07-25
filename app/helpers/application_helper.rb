module ApplicationHelper
    def avatar_url(user)
        gravatar_id = Digest::MD5::hexdigest(user.email).downcase
        "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
    end

    def flash_class(level)
        case level.to_sym
            when :notice then "alert alert-success"
            when :success then "alert alert-success"
            when :error then "alert alert-warning"
            when :alert then "alert alert-danger"  
        end
    end
end