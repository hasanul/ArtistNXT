DEFAULT_TEMPLATE_LANG = 'en'        
# Removing missing translation errors for english
module I18n
  class MissingTranslation
    def html_message
      if DEFAULT_TEMPLATE_LANG == keys[0].to_s
        keys[1].to_s
      else
        ""
      end
    end
  end
end