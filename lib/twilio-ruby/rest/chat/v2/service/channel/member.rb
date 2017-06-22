##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Chat < Domain
      class V2 < Version
        class ServiceContext < InstanceContext
          class ChannelContext < InstanceContext
            class MemberList < ListResource
              ##
              # Initialize the MemberList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The service_sid
              # @param [String] channel_sid The channel_sid
              # @return [MemberList] MemberList
              def initialize(version, service_sid: nil, channel_sid: nil)
                super(version)

                # Path Solution
                @solution = {
                    service_sid: service_sid,
                    channel_sid: channel_sid
                }
                @uri = "/Services/#{@solution[:service_sid]}/Channels/#{@solution[:channel_sid]}/Members"
              end

              ##
              # Retrieve a single page of MemberInstance records from the API.
              # Request is executed immediately.
              # @param [String] identity The identity
              # @param [String] role_sid The role_sid
              # @return [MemberInstance] Newly created MemberInstance
              def create(identity: nil, role_sid: :unset)
                data = Twilio::Values.of({
                    'Identity' => identity,
                    'RoleSid' => role_sid,
                })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                MemberInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                )
              end

              ##
              # Lists MemberInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [String] identity The identity
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #                   guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
              #  the default value of 50 records.  If no page_size is                      defined
              #  but a limit is defined, stream() will attempt to read                      the
              #  limit with the most efficient page size,                      i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(identity: :unset, limit: nil, page_size: nil)
                self.stream(
                    identity: identity,
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams MemberInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [String] identity The identity
              # @param [Integer] limit Upper limit for the number of records to return.                  stream()
              #  guarantees to never return more than limit.                  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
              #  the default value of 50 records.                      If no page_size is defined
              #                       but a limit is defined, stream() will attempt to                      read the
              #  limit with the most efficient page size,                       i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(identity: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(
                    identity: identity,
                    page_size: limits[:page_size],
                )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields MemberInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [String] identity The identity
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
              # Retrieve a single page of MemberInstance records from the API.
              # Request is executed immediately.
              # @param [String] identity The identity
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of MemberInstance
              def page(identity: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'Identity' => identity,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                MemberPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of MemberInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of MemberInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                MemberPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Chat.V2.MemberList>'
              end
            end

            class MemberPage < Page
              ##
              # Initialize the MemberPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @param [String] service_sid The service_sid
              # @param [String] channel_sid The channel_sid
              # @return [MemberPage] MemberPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of MemberInstance
              # @param [Hash] payload Payload response from the API
              # @return [MemberInstance] MemberInstance
              def get_instance(payload)
                MemberInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Chat.V2.MemberPage>'
              end
            end

            class MemberContext < InstanceContext
              ##
              # Initialize the MemberContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The service_sid
              # @param [String] channel_sid The channel_sid
              # @param [String] sid The sid
              # @return [MemberContext] MemberContext
              def initialize(version, service_sid, channel_sid, sid)
                super(version)

                # Path Solution
                @solution = {
                    service_sid: service_sid,
                    channel_sid: channel_sid,
                    sid: sid,
                }
                @uri = "/Services/#{@solution[:service_sid]}/Channels/#{@solution[:channel_sid]}/Members/#{@solution[:sid]}"
              end

              ##
              # Fetch a MemberInstance
              # @return [MemberInstance] Fetched MemberInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                MemberInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Deletes the MemberInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Update the MemberInstance
              # @param [String] role_sid The role_sid
              # @param [String] last_consumed_message_index The last_consumed_message_index
              # @return [MemberInstance] Updated MemberInstance
              def update(role_sid: :unset, last_consumed_message_index: :unset)
                data = Twilio::Values.of({
                    'RoleSid' => role_sid,
                    'LastConsumedMessageIndex' => last_consumed_message_index,
                })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                MemberInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Chat.V2.MemberContext #{context}>"
              end
            end

            class MemberInstance < InstanceResource
              ##
              # Initialize the MemberInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The service_sid
              # @param [String] channel_sid The channel_sid
              # @param [String] sid The sid
              # @return [MemberInstance] MemberInstance
              def initialize(version, payload, service_sid: nil, channel_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'channel_sid' => payload['channel_sid'],
                    'service_sid' => payload['service_sid'],
                    'identity' => payload['identity'],
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                    'role_sid' => payload['role_sid'],
                    'last_consumed_message_index' => payload['last_consumed_message_index'] == nil ? payload['last_consumed_message_index'] : payload['last_consumed_message_index'].to_i,
                    'last_consumption_timestamp' => Twilio.deserialize_iso8601_datetime(payload['last_consumption_timestamp']),
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'channel_sid' => channel_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @param [Version] version Version that contains the resource
              # @return [MemberContext] MemberContext for this MemberInstance
              def context
                unless @instance_context
                  @instance_context = MemberContext.new(
                      @version,
                      @params['service_sid'],
                      @params['channel_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              def sid
                @properties['sid']
              end

              def account_sid
                @properties['account_sid']
              end

              def channel_sid
                @properties['channel_sid']
              end

              def service_sid
                @properties['service_sid']
              end

              def identity
                @properties['identity']
              end

              def date_created
                @properties['date_created']
              end

              def date_updated
                @properties['date_updated']
              end

              def role_sid
                @properties['role_sid']
              end

              def last_consumed_message_index
                @properties['last_consumed_message_index']
              end

              def last_consumption_timestamp
                @properties['last_consumption_timestamp']
              end

              def url
                @properties['url']
              end

              ##
              # Fetch a MemberInstance
              # @return [MemberInstance] Fetched MemberInstance
              def fetch
                context.fetch
              end

              ##
              # Deletes the MemberInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                context.delete
              end

              ##
              # Update the MemberInstance
              # @param [String] role_sid The role_sid
              # @param [String] last_consumed_message_index The last_consumed_message_index
              # @return [MemberInstance] Updated MemberInstance
              def update(role_sid: :unset, last_consumed_message_index: :unset)
                context.update(
                    role_sid: role_sid,
                    last_consumed_message_index: last_consumed_message_index,
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Chat.V2.MemberInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end