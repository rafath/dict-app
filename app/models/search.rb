require 'exceptions'
require 'dict'

class Search
  def initialize
  end

  def get_single_service(service, query)
    Dict.get_single_dictionary_translations(query, service)
	rescue Exception
      raise LoadError
  end

  def get_results_for(services, query)
    {}.tap do |results|
      services.each do |service|
        results[service] = get_single_service(service, query)
      end
    end
  end

  def available_dictionaries
    Dict.available_dictionaries
  end
end
