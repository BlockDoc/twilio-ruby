##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Trunking < Domain
      class V1 < Version
        class TrunkContext < InstanceContext
          class PhoneNumberList < ListResource
            ##
            # Initialize the PhoneNumberList
            # @param [Version] version Version that contains the resource
            # @param [String] trunk_sid The trunk_sid
            # @return [PhoneNumberList] PhoneNumberList
            def initialize(version, trunk_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  trunk_sid: trunk_sid
              }
              @uri = "/Trunks/#{@solution[:trunk_sid]}/PhoneNumbers"
            end

            ##
            # Retrieve a single page of PhoneNumberInstance records from the API.
            # Request is executed immediately.
            # @param [String] phone_number_sid The phone_number_sid
            # @return [PhoneNumberInstance] Newly created PhoneNumberInstance
            def create(phone_number_sid: nil)
              data = Twilio::Values.of({
                  'PhoneNumberSid' => phone_number_sid,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              PhoneNumberInstance.new(
                  @version,
                  payload,
                  trunk_sid: @solution[:trunk_sid],
              )
            end

            ##
            # Lists PhoneNumberInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams PhoneNumberInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields PhoneNumberInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to read the
            #                       limit with the most efficient page size, i.e. min(limit, 1000)
            def each
              limits = @version.read_limits

              page = self.page(
                  page_size: limits[:page_size],
              )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of PhoneNumberInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of PhoneNumberInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              PhoneNumberPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of PhoneNumberInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of PhoneNumberInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              PhoneNumberPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Trunking.V1.PhoneNumberList>'
            end
          end

          class PhoneNumberPage < Page
            ##
            # Initialize the PhoneNumberPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] trunk_sid The trunk_sid
            # @return [PhoneNumberPage] PhoneNumberPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of PhoneNumberInstance
            # @param [Hash] payload Payload response from the API
            # @return [PhoneNumberInstance] PhoneNumberInstance
            def get_instance(payload)
              PhoneNumberInstance.new(
                  @version,
                  payload,
                  trunk_sid: @solution[:trunk_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Trunking.V1.PhoneNumberPage>'
            end
          end

          class PhoneNumberContext < InstanceContext
            ##
            # Initialize the PhoneNumberContext
            # @param [Version] version Version that contains the resource
            # @param [String] trunk_sid The trunk_sid
            # @param [String] sid The sid
            # @return [PhoneNumberContext] PhoneNumberContext
            def initialize(version, trunk_sid, sid)
              super(version)

              # Path Solution
              @solution = {
                  trunk_sid: trunk_sid,
                  sid: sid,
              }
              @uri = "/Trunks/#{@solution[:trunk_sid]}/PhoneNumbers/#{@solution[:sid]}"
            end

            ##
            # Fetch a PhoneNumberInstance
            # @return [PhoneNumberInstance] Fetched PhoneNumberInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              PhoneNumberInstance.new(
                  @version,
                  payload,
                  trunk_sid: @solution[:trunk_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Deletes the PhoneNumberInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Trunking.V1.PhoneNumberContext #{context}>"
            end
          end

          class PhoneNumberInstance < InstanceResource
            ##
            # Initialize the PhoneNumberInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] trunk_sid The trunk_sid
            # @param [String] sid The sid
            # @return [PhoneNumberInstance] PhoneNumberInstance
            def initialize(version, payload, trunk_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'address_requirements' => payload['address_requirements'],
                  'api_version' => payload['api_version'],
                  'beta' => payload['beta'],
                  'capabilities' => payload['capabilities'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'friendly_name' => payload['friendly_name'],
                  'links' => payload['links'],
                  'phone_number' => payload['phone_number'],
                  'sid' => payload['sid'],
                  'sms_application_sid' => payload['sms_application_sid'],
                  'sms_fallback_method' => payload['sms_fallback_method'],
                  'sms_fallback_url' => payload['sms_fallback_url'],
                  'sms_method' => payload['sms_method'],
                  'sms_url' => payload['sms_url'],
                  'status_callback' => payload['status_callback'],
                  'status_callback_method' => payload['status_callback_method'],
                  'trunk_sid' => payload['trunk_sid'],
                  'url' => payload['url'],
                  'voice_application_sid' => payload['voice_application_sid'],
                  'voice_caller_id_lookup' => payload['voice_caller_id_lookup'],
                  'voice_fallback_method' => payload['voice_fallback_method'],
                  'voice_fallback_url' => payload['voice_fallback_url'],
                  'voice_method' => payload['voice_method'],
                  'voice_url' => payload['voice_url'],
              }

              # Context
              @instance_context = nil
              @params = {
                  'trunk_sid' => trunk_sid,
                  'sid' => sid || @properties['sid'],
              }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [PhoneNumberContext] PhoneNumberContext for this PhoneNumberInstance
            def context
              unless @instance_context
                @instance_context = PhoneNumberContext.new(
                    @version,
                    @params['trunk_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end

            def account_sid
              @properties['account_sid']
            end

            def address_requirements
              @properties['address_requirements']
            end

            def api_version
              @properties['api_version']
            end

            def beta
              @properties['beta']
            end

            def capabilities
              @properties['capabilities']
            end

            def date_created
              @properties['date_created']
            end

            def date_updated
              @properties['date_updated']
            end

            def friendly_name
              @properties['friendly_name']
            end

            def links
              @properties['links']
            end

            def phone_number
              @properties['phone_number']
            end

            def sid
              @properties['sid']
            end

            def sms_application_sid
              @properties['sms_application_sid']
            end

            def sms_fallback_method
              @properties['sms_fallback_method']
            end

            def sms_fallback_url
              @properties['sms_fallback_url']
            end

            def sms_method
              @properties['sms_method']
            end

            def sms_url
              @properties['sms_url']
            end

            def status_callback
              @properties['status_callback']
            end

            def status_callback_method
              @properties['status_callback_method']
            end

            def trunk_sid
              @properties['trunk_sid']
            end

            def url
              @properties['url']
            end

            def voice_application_sid
              @properties['voice_application_sid']
            end

            def voice_caller_id_lookup
              @properties['voice_caller_id_lookup']
            end

            def voice_fallback_method
              @properties['voice_fallback_method']
            end

            def voice_fallback_url
              @properties['voice_fallback_url']
            end

            def voice_method
              @properties['voice_method']
            end

            def voice_url
              @properties['voice_url']
            end

            ##
            # Fetch a PhoneNumberInstance
            # @return [PhoneNumberInstance] Fetched PhoneNumberInstance
            def fetch
              context.fetch
            end

            ##
            # Deletes the PhoneNumberInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Trunking.V1.PhoneNumberInstance #{values}>"
            end
          end
        end
      end
    end
  end
end