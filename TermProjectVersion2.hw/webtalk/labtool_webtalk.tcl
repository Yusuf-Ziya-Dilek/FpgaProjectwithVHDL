webtalk_init -webtalk_dir C:/Users/LENOVO PC/TermProjectVersion2/TermProjectVersion2.hw/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Thu Apr 20 21:10:36 2017" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "Vivado v2015.2 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "1266856" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "WIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "211319115_0_0_646" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "labtool" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "6d3524e0-88d8-4277-bec3-47d068fa49d7" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "2032fc4d-fa8a-4af0-9a4e-ab0efe4bd5b2" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "4" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Microsoft Windows 8 or later , 64-bit" -context "user_environment"
webtalk_add_data -client project -key os_release -value "major release  (build 9200)" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i7-4720HQ CPU @ 2.60GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "2594 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "8.000 GB" -context "user_environment"
webtalk_register_client -client labtool
webtalk_add_data -client labtool -key cable -value "Digilent/Basys3/15000000" -context "labtool\\usage"
webtalk_add_data -client labtool -key chain -value "0362D093" -context "labtool\\usage"
webtalk_add_data -client labtool -key pgmcnt -value "04:00:00" -context "labtool\\usage"
webtalk_transmit -clientid 644334032 -regid "211319115_0_0_646" -xml C:/Users/LENOVO PC/TermProjectVersion2/TermProjectVersion2.hw/webtalk/usage_statistics_ext_labtool.xml -html C:/Users/LENOVO PC/TermProjectVersion2/TermProjectVersion2.hw/webtalk/usage_statistics_ext_labtool.html -wdm C:/Users/LENOVO PC/TermProjectVersion2/TermProjectVersion2.hw/webtalk/usage_statistics_ext_labtool.wdm -intro "<H3>LABTOOL Usage Report</H3><BR>"
webtalk_terminate
