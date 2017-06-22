##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class WorkerContext < InstanceContext
            class WorkerChannelList < ListResource
              ##
              # Initialize the WorkerChannelList
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The workspace_sid
              # @param [String] worker_sid The worker_sid
              # @return [WorkerChannelList] WorkerChannelList
              def initialize(version, workspace_sid: nil, worker_sid: nil)
                super(version)

                # Path Solution
                @solution = {
                    workspace_sid: workspace_sid,
                    worker_sid: worker_sid
                }
                @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workers/#{@solution[:worker_sid]}/Channels"
              end

              ##
              # Lists WorkerChannelInstance records from the API as a list.
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
              # Streams WorkerChannelInstance records from the API as an Enumerable.
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
              # When passed a block, yields WorkerChannelInstance records from the API.
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
              # Retrieve a single page of WorkerChannelInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of WorkerChannelInstance
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
                WorkerChannelPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of WorkerChannelInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of WorkerChannelInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                WorkerChannelPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Taskrouter.V1.WorkerChannelList>'
              end
            end

            class WorkerChannelPage < Page
              ##
              # Initialize the WorkerChannelPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @param [String] workspace_sid The workspace_sid
              # @param [String] worker_sid The worker_sid
              # @return [WorkerChannelPage] WorkerChannelPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of WorkerChannelInstance
              # @param [Hash] payload Payload response from the API
              # @return [WorkerChannelInstance] WorkerChannelInstance
              def get_instance(payload)
                WorkerChannelInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    worker_sid: @solution[:worker_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Taskrouter.V1.WorkerChannelPage>'
              end
            end

            class WorkerChannelContext < InstanceContext
              ##
              # Initialize the WorkerChannelContext
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The workspace_sid
              # @param [String] worker_sid The worker_sid
              # @param [String] sid The sid
              # @return [WorkerChannelContext] WorkerChannelContext
              def initialize(version, workspace_sid, worker_sid, sid)
                super(version)

                # Path Solution
                @solution = {
                    workspace_sid: workspace_sid,
                    worker_sid: worker_sid,
                    sid: sid,
                }
                @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workers/#{@solution[:worker_sid]}/Channels/#{@solution[:sid]}"
              end

              ##
              # Fetch a WorkerChannelInstance
              # @return [WorkerChannelInstance] Fetched WorkerChannelInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                WorkerChannelInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    worker_sid: @solution[:worker_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Update the WorkerChannelInstance
              # @param [String] capacity The capacity
              # @param [Boolean] available The available
              # @return [WorkerChannelInstance] Updated WorkerChannelInstance
              def update(capacity: :unset, available: :unset)
                data = Twilio::Values.of({
                    'Capacity' => capacity,
                    'Available' => available,
                })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                WorkerChannelInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    worker_sid: @solution[:worker_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Taskrouter.V1.WorkerChannelContext #{context}>"
              end
            end

            class WorkerChannelInstance < InstanceResource
              ##
              # Initialize the WorkerChannelInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] workspace_sid The workspace_sid
              # @param [String] worker_sid The worker_sid
              # @param [String] sid The sid
              # @return [WorkerChannelInstance] WorkerChannelInstance
              def initialize(version, payload, workspace_sid: nil, worker_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'assigned_tasks' => payload['assigned_tasks'].to_i,
                    'available' => payload['available'],
                    'available_capacity_percentage' => payload['available_capacity_percentage'].to_i,
                    'configured_capacity' => payload['configured_capacity'].to_i,
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                    'sid' => payload['sid'],
                    'task_channel_sid' => payload['task_channel_sid'],
                    'task_channel_unique_name' => payload['task_channel_unique_name'],
                    'worker_sid' => payload['worker_sid'],
                    'workspace_sid' => payload['workspace_sid'],
                    'links' => payload['links'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'workspace_sid' => workspace_sid,
                    'worker_sid' => worker_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @param [Version] version Version that contains the resource
              # @return [WorkerChannelContext] WorkerChannelContext for this WorkerChannelInstance
              def context
                unless @instance_context
                  @instance_context = WorkerChannelContext.new(
                      @version,
                      @params['workspace_sid'],
                      @params['worker_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              def account_sid
                @properties['account_sid']
              end

              def assigned_tasks
                @properties['assigned_tasks']
              end

              def available
                @properties['available']
              end

              def available_capacity_percentage
                @properties['available_capacity_percentage']
              end

              def configured_capacity
                @properties['configured_capacity']
              end

              def date_created
                @properties['date_created']
              end

              def date_updated
                @properties['date_updated']
              end

              def sid
                @properties['sid']
              end

              def task_channel_sid
                @properties['task_channel_sid']
              end

              def task_channel_unique_name
                @properties['task_channel_unique_name']
              end

              def worker_sid
                @properties['worker_sid']
              end

              def workspace_sid
                @properties['workspace_sid']
              end

              def links
                @properties['links']
              end

              def url
                @properties['url']
              end

              ##
              # Fetch a WorkerChannelInstance
              # @return [WorkerChannelInstance] Fetched WorkerChannelInstance
              def fetch
                context.fetch
              end

              ##
              # Update the WorkerChannelInstance
              # @param [String] capacity The capacity
              # @param [Boolean] available The available
              # @return [WorkerChannelInstance] Updated WorkerChannelInstance
              def update(capacity: :unset, available: :unset)
                context.update(
                    capacity: capacity,
                    available: available,
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Taskrouter.V1.WorkerChannelInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end