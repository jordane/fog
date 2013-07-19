Shindo.tests('Fog::Rackspace::Monitoring | alarm_example_tests', ['rackspace', 'rackspace_monitoring']) do

  account = Fog::Rackspace::Monitoring.new({})
  example_id = "remote.http_body_match_1"
  tests('success') do
    tests('#list alarm examples').formats(LIST_HEADERS_FORMAT) do
      account.list_alarm_examples().data[:headers]
    end
    pending if Fog.mocking?
    tests('#get alarm example').formats(LIST_HEADERS_FORMAT) do
      account.get_alarm_example(example_id).data[:headers]
    end
    tests('#evaluate alarm example').formats(LIST_HEADERS_FORMAT) do
      options = { :string => "Foo"}
      account.evaluate_alarm_example(example_id,options).data[:headers]
    end
  end
  pending if Fog.mocking?
  tests('failure') do
    tests('#fail to list alarm examples(-1)').raises(Fog::Rackspace::Monitoring::ArgumentError) do
      account.list_alarm_examples(-1).data[:headers]
    end
    tests('#fail to get alarm example(-1)').raises(Fog::Rackspace::Monitoring::NotFound) do
      account.get_alarm_example(-1).data[:headers]
    end
    tests('#fail to evaluate alarm example').raises(Fog::Rackspace::Monitoring::BadRequest) do
      options = { }
      account.evaluate_alarm_example(example_id,options).data[:headers]
    end
  end
end