##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Video < Domain
      class V1 < Version
        class RoomContext < InstanceContext
          class RoomRecordingList < ListResource
            ##
            # Initialize the RoomRecordingList
            # @param [Version] version Version that contains the resource
            # @param [String] room_sid The room_sid
            # @return [RoomRecordingList] RoomRecordingList
            def initialize(version, room_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  room_sid: room_sid
              }
              @uri = "/Rooms/#{@solution[:room_sid]}/Recordings"
            end

            ##
            # Lists RoomRecordingInstance records from the API as a list.
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
            # Streams RoomRecordingInstance records from the API as an Enumerable.
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
            # When passed a block, yields RoomRecordingInstance records from the API.
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
            # Retrieve a single page of RoomRecordingInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of RoomRecordingInstance
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
              RoomRecordingPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of RoomRecordingInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of RoomRecordingInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              RoomRecordingPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Video.V1.RoomRecordingList>'
            end
          end

          class RoomRecordingPage < Page
            ##
            # Initialize the RoomRecordingPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] room_sid The room_sid
            # @return [RoomRecordingPage] RoomRecordingPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of RoomRecordingInstance
            # @param [Hash] payload Payload response from the API
            # @return [RoomRecordingInstance] RoomRecordingInstance
            def get_instance(payload)
              RoomRecordingInstance.new(
                  @version,
                  payload,
                  room_sid: @solution[:room_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Video.V1.RoomRecordingPage>'
            end
          end

          class RoomRecordingContext < InstanceContext
            ##
            # Initialize the RoomRecordingContext
            # @param [Version] version Version that contains the resource
            # @param [String] room_sid The room_sid
            # @param [String] sid The sid
            # @return [RoomRecordingContext] RoomRecordingContext
            def initialize(version, room_sid, sid)
              super(version)

              # Path Solution
              @solution = {
                  room_sid: room_sid,
                  sid: sid,
              }
              @uri = "/Rooms/#{@solution[:room_sid]}/Recordings/#{@solution[:sid]}"
            end

            ##
            # Fetch a RoomRecordingInstance
            # @return [RoomRecordingInstance] Fetched RoomRecordingInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              RoomRecordingInstance.new(
                  @version,
                  payload,
                  room_sid: @solution[:room_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Video.V1.RoomRecordingContext #{context}>"
            end
          end

          class RoomRecordingInstance < InstanceResource
            ##
            # Initialize the RoomRecordingInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] room_sid The room_sid
            # @param [String] sid The sid
            # @return [RoomRecordingInstance] RoomRecordingInstance
            def initialize(version, payload, room_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'status' => payload['status'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'sid' => payload['sid'],
                  'source_sid' => payload['source_sid'],
                  'size' => payload['size'] == nil ? payload['size'] : payload['size'].to_i,
                  'type' => payload['type'],
                  'duration' => payload['duration'] == nil ? payload['duration'] : payload['duration'].to_i,
                  'container_format' => payload['container_format'],
                  'codec' => payload['codec'],
                  'grouping_sids' => payload['grouping_sids'],
                  'room_sid' => payload['room_sid'],
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {
                  'room_sid' => room_sid,
                  'sid' => sid || @properties['sid'],
              }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [RoomRecordingContext] RoomRecordingContext for this RoomRecordingInstance
            def context
              unless @instance_context
                @instance_context = RoomRecordingContext.new(
                    @version,
                    @params['room_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end

            def account_sid
              @properties['account_sid']
            end

            def status
              @properties['status']
            end

            def date_created
              @properties['date_created']
            end

            def sid
              @properties['sid']
            end

            def source_sid
              @properties['source_sid']
            end

            def size
              @properties['size']
            end

            def type
              @properties['type']
            end

            def duration
              @properties['duration']
            end

            def container_format
              @properties['container_format']
            end

            def codec
              @properties['codec']
            end

            def grouping_sids
              @properties['grouping_sids']
            end

            def room_sid
              @properties['room_sid']
            end

            def url
              @properties['url']
            end

            def links
              @properties['links']
            end

            ##
            # Fetch a RoomRecordingInstance
            # @return [RoomRecordingInstance] Fetched RoomRecordingInstance
            def fetch
              context.fetch
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Video.V1.RoomRecordingInstance #{values}>"
            end
          end
        end
      end
    end
  end
end