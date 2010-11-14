$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','..','lib'))

require 'sabnzbd_plus/model/api/caller/http_json'

# Abstraction layer for interacting with SABnzbd+
module SabnzbdPlusModelApi
  # The SABnzbd+ API
  class Api
    # Set-up the Caller to use. Defaults to the HttpJson Caller
    #
    # @param [SabnzbdPlusModelApiCaller::HttpJson] caller
    def initialize(caller = SabnzbdPlusModelApiCaller::HttpJson.new)
      @caller = caller
    end

    # Depreciated now by the advanced queue output, this is the old api that
    # just provides limited details on the current queue and state of sabnzbd
    #
    # Added in 0.3
    #
    # @example Example Return Data
    #   {
    #       "timeleft" => "0:00:00",
    #       "mb" => 854.697841,
    #       "noofslots" => 1,
    #       "paused" => true,
    #       "mbleft" => 854.697841,
    #       "diskspace2" => 21.980682,
    #       "diskspace1" => 21.980682,
    #       "kbpersec" => 0.000000,
    #       "jobs" => [
    #           {"msgid" => "3066202",
    #           "filename" =>
    #           "Ubuntu 8.04 (Hardy Heron) - Desktop CD x64",
    #           "mbleft" => 854.697841,"id" => "SABnzbd_nzo_zt2syz",
    #           "mb" => 854.697841}
    #       ]
    #   }
    #
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def qstatus
      return @caller.call("qstatus", {})
    end

    # A verbose output that as well as reporting items in the queue, will report
    # on finished items being processed (verify/repaired/extracted) and other 
    # details such as categories, scripts.
    #
    # Added in 0.5
    # 
    # @example Listing history
    #   queue()
    #
    # Added in 0.3
    #
    # @example Deleting a single item
    #   queue({:name => "delete", :value => "SABnzbd_nzo_zt2syz"})
    # @example Deleting multiple items
    #   queue({:name => "delete", :value => "SABnzbd_nzo_zt2syz,SABnzbd_nzo_df2hyd,SABnzbd_nzo_op3shf"})
    # @example Deleting all items
    #   queue({:name => "delete", :value => "all"})
    # @example Change Priority
    #   queue({:name => "priority", :value => "SABnzbd_nzo_zt2syz", :value2 => 0})
    #
    # Added in 0.5
    # 
    # Low Priority: -1
    # Normal Priority: 0
    # High Priority: 1
    # Will return the new position in the queue if successful.
    #
    # @example Change item name
    #   queue({:name => "rename", :value => "SABnzbd_nzo_zt2syz", :value2 => "THENEWNAME"})
    # Changes the name of an item in the queue. The name is used for the final
    # foldername, and input for any post-processing sorting, if used.
    #
    # Added in 0.5
    #
    # @example Pause individual download
    #   queue({:name => "pause", :value => "SABnzbd_nzo_zt2syz"})
    # @example Resume individual download
    #   queue({:name => "resume", :value => "SABnzbd_nzo_zt2syz"})
    # @example Action on queue complete
    #   queue({:name => "change_complete_action", :value => "hybernate_pc"})
    # @example Script action on queue complete
    #   queue({:name => "change_complete_action", :value => "script_examplescript.cmd"})
    # prefix script_ to the script name to execute
    #
    # Added in 0.4
    #
    # @example Example Return Data
    #   {
    #       "cache_limit" => "-1",
    #       "categories" => [
    #               "None",
    #               "apps",
    #               "books",
    #               "consoles",
    #               "emulation",
    #               "games",
    #               "misc",
    #               "movies",
    #               "music",
    #               "pda",
    #               "resources",
    #               "tv"
    #               ],
    #       "scripts" => [
    #               "None"
    #               ],
    #       "paused" => true,
    #       "new_rel_url" => "",
    #       "restart_req" => false,
    #       "slots" => [
    #           {
    #           "status" => "Queued",
    #           "index" => 0,
    #           "eta" => "unknown",
    #           "timeleft" => "0:00:00",
    #           "avg_age" => "43d",
    #           "script" => "None",
    #           "msgid" => "4295398",
    #           "verbosity" => "",
    #           "mb" => "785.89",
    #           "filename" => "Ubuntu v.8.10",
    #           "priority" => "Normal",
    #           "cat" => "Apps",
    #           "mbleft" => "785.89",
    #           "percentage" => "0",
    #           "nzo_id" => "SABnzbd_nzo_wgmb1m",
    #           "unpackopts" => "3",
    #           "size" => "785.9 MB"
    #           }],
    #       "helpuri" => "http://wiki.sabnzbd.org/",
    #       "uptime" => "6m",
    #       "refresh_rate" => "",
    #       "isverbose" => false,
    #       "start" => 0,
    #       "version" => "trunk",
    #       "diskspacetotal2" => "503.32",
    #       "color_scheme" => "",
    #       "darwin" => false,
    #       "nt" => true,
    #       "status" => "Paused",
    #       "last_warning" => "",
    #       "have_warnings" => "0",
    #       "cache_art" => "0",
    #       "finishaction" => null,
    #       "noofslots" => 1,
    #       "cache_size" => "0",
    #       "finish" => 0,
    #       "new_release" => "",
    #       "pause_int" => "0"
    #       ,"mbleft" => "785.89",
    #       "diskspace2" => "25.08",
    #       "diskspace1" => "25.08",
    #       "diskspacetotal1" => "503.32",
    #       "timeleft" => "0:00:00",
    #       "mb" => "785.89",
    #       "newzbinDetails" => true,
    #       "eta" => "unknown",
    #       "nzb_quota" => "",
    #       "loadavg" => "",
    #       "limit" => 0,
    #       "kbpersec" => "0.00",
    #       "speedlimit" => "0",
    #       "webdir" => "path\\to\\templates",
    #       "queue_details" => "0"
    #   }
    #
    # @param [Hash] options the options to make the call with.
    # @option options [String] :name
    # @option options [String] :value
    # @option options [String] :value2
    # @option options [String] :start
    # @option options [String] :limit
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def queue(options = {})
      return @caller.call("queue", options)
    end

    # A verbose output that as well as reporting items in the queue, will report
    # on finished items being processed (verify/repaired/extracted) and other
    # details such as categories, scripts.
    #
    # Added in 0.5
    #
    # @example Listing history
    #   history()
    #
    # Added in 0.3
    #
    # @example Deleting a single item
    #   history({:name => "delete", :value => "SABnzbd_nzo_zt2syz"})
    # @example Deleting multiple items
    #   history({:name => "delete", :value => "SABnzbd_nzo_zt2syz,SABnzbd_nzo_df2hyd,SABnzbd_nzo_op3shf"})
    # @example Deleting all items
    #   history({:name => "delete", :value => "all"})
    # @example Retry a single item
    #   history({:name => "retry", :value => "SABnzbd_nzo_zt2syz"})
    # @example Example Return Data
    #   {
    #       "total_size" =>  40.30 GB,       **Since 0.5.2
    #       "month_size" =>  20.23 GB,      **Since 0.5.2
    #       "week_size" =>  5.12 GB,         **Since 0.5.2
    #       "cache_limit" => "-1",
    #       "paused" => true,
    #       "new_rel_url" => "",
    #       "restart_req" => false,
    #       "slots" => [
    #       {
    #           "action_line" => "",
    #           "show_details" => "True",
    #           "script_log" => "",
    #           "meta" => nil,
    #           "fail_message" => "",
    #           "loaded" => false,
    #           "id" => 605,
    #           "size" => "778.1 MB",
    #           "category" => "Apps",
    #           "pp" => "D",
    #           "completeness" => 0,
    #           "script" => "",
    #           "nzb_name" => "Ubuntu.nzb",
    #           "download_time" => 567,
    #           "storage" => "X:\\Apps\\Ubuntu",
    #           "status" => "Completed",
    #           "script_line" => "",
    #           "completed" => 1236646078,
    #           "nzo_id" => "SABnzbd_nzo_ipet0h",
    #           "downloaded" => 815878352,
    #           "report" => "000000",
    #           "path" => "Ubuntu",
    #           "postproc_time" => 368,
    #           "name" => "Ubuntu",
    #           "url" => "https://newzbin.com/browse/post/000000/",
    #           "bytes" => 815878352,
    #           "url_info" => "http://google.com",
    #           "stage_log" => [
    #               {"name" => "download","actions" => ["Downloaded in 9 minutes 27 seconds at an average of 1404kB/s"]},
    #               {"name" => "repair","actions" => ["[ubuntu] Repaired in 4 minutes 24 seconds","[ubuntu.sample] Quick Check OK"]},
    #               {"name" => "unpack","actions" => ["[ubuntu] Unpacked 1 file/folder in 36 seconds"]}
    #           ]
    #       }],
    #       "helpuri" => "http://wiki.sabnzbd.org/",
    #       "uptime" => "12m",
    #       "version" => "trunk",
    #       "diskspacetotal2" => "503.32",
    #       "color_scheme" => "",
    #       "darwin" => false,
    #       "nt" => true,
    #       "status" => "Paused",
    #       "last_warning" => "",
    #       "have_warnings" => "0",
    #       "cache_art" => "0",
    #       "finishaction" => null,
    #       "noofslots" => 516,
    #       "cache_size" => "0",
    #       "new_release" => "",
    #       "pause_int" => "0",
    #       "mbleft" => "785.89",
    #       "diskspace2" => "25.08",
    #       "diskspace1" => "25.08",
    #       "diskspacetotal1" => "503.32",
    #       "timeleft" => "0:00:00",
    #       "mb" => "785.89",
    #       "eta" => "unknown",
    #       "nzb_quota" => "",
    #       "loadavg" => "",
    #       "kbpersec" => "0.00",
    #       "speedlimit" => "0",
    #       "webdir" => "path\\to\\templates"
    #   }
    # 
    # @param [Hash] params the options to create a make the call with.
    # @option params [String] :name
    # @option params [String] :value
    # @option params [String] :start
    # @option params [String] :limit
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def history(params = {})
      return @caller.call("history", params)
    end

    # Get the version
    #
    # Added in 0.4
    #
    # @example Example Return Data
    #   {"version" => "0.4.6"}
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def version
      return @caller.call("version", {})
    end

    # Current warnings
    #
    # Added in 0.4
    #
    # @example Example Return Data
    #   {
    #      "warnings" => [
    #          "2008-12-26 19:53:42,567\nWARNING\n[decoder] Badly formed yEnc article in <Article: article=, bytes=, partnum=, art_id=>",
    #          "2008-12-26 19:54:45,861\nWARNING\n[assembler] <Article: article=, bytes=, partnum=, art_id=> missing",
    #          "2008-12-26 20:44:28,336\nWARNING\n[decoder] CRC Error in <Article: article=, bytes=, partnum=, art_id=> (4134546D -> A8F07173)",
    #          "2008-12-27 01:13:37,349\nWARNING\n[downloader] Thread 3@news.powerusenet.com:119: timed out",
    #          "2008-12-27 01:13:38,365\nWARNING\n[downloader] Thread 2@news.powerusenet.com:119: timed out",
    #          "2008-12-27 01:45:34,041\nWARNING\n[downloader] Thread 1@news.powerusenet.com:119: timed out"
    #      ]
    #   }
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def warnings
      return @caller.call("warnings", {})
    end

    # Current categories
    #
    # Added in 0.4
    #
    # @example Example Return Data
    #   {"categories"=>["None","Video"]}
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def get_cats
      return @caller.call("get_cats", {})
    end

    # Return Scripts
    #
    # Added in 0.4
    #
    # @example Example Return Data
    #   {"scripts":["None","examplescript.cmd"]}
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def get_scripts
      return @caller.call("get_scripts", {})
    end

    # Restart SABnzbd
    #
    # Added in 0.5
    #
    # @example Example Return Data
    #   "ok
    #   "
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def restart
      return @caller.call("restart", {})
    end

    # Moving two items
    #
    # 0.5 - Will return the new position and priority (space separated, can be
    # -1 if error occurs)
    # @example Swapping two items
    #   switch({:value => "SABnzbd_nzo_zt2syz",:value2 => "SABnzbd_nzo_df2hyd"})
    #
    # "value" is the item you want to move, "value2" is the name of the item
    # where you want to put value one above, shifting value2 down.
    #
    # @example Moving to a specific location in the queue.
    #   switch({:value => "SABnzbd_nzo_zt2syz",:value2 => 0})
    # 
    # "value2" is the position in the queue where you wish to move the object.
    # 0 is the top of the queue, 1 is the second item, etc..
    #
    # @param [Hash] options the options to make the call with.
    # @option options [String] :value
    # @option options [String] :value2
    #
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def switch(options = {})
      return @caller.call("switch", options)
    end

    # Pauses the whole queue (do not confuse this will pausing an individual 
    # download, this is a global pause)
    # 
    # Added in 0.3
    #
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def pause
      return @caller.call("pause", {})
    end

    # @example Temporary Pause
    #   config({:name => "set_pause", :value => 60})
    #
    # Pauses for a set amount of time (value is the time in minutes to pause the queue)
    #
    # Added in 0.5
    #
    # @example Set Download Speed limit
    #   config({:name => "speedlimit", :value => 400})
    #
    # @example Regenerate new API Key
    #   config({:name => "set_apikey"})
    #
    # Returns the new API Key
    #
    # @param [Hash] options the options to make the call with.
    # @option options [String] :name
    # @option options [String] :value
    #
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def config(options = {})
      return @caller.call("config", options)
    end

    # Resumes the whole queue (do not confuse this will resuming an individual
    # download, this is a global resume)Resumes the whole queue (do not confuse
    # this will resuming an individual download, this is a global resume)
    #
    # Added in 0.3
    #
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def resume
      return @caller.call("resume", {})
    end

    # Shuts down SABnzbd.
    #
    # Added in 0.3
    #
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def shutdown
      return @caller.call("shutdown", {})
    end

    # pp, script, cat and priority are all optional. This example adds the nzb
    # into the queue marked as low priority, assigned with a categoriy of
    # "Example", to execute "customscript.cmd" once finished, and with the
    # unpacking option 3 (Repair, Unpack and Delete)
    #
    # Allows full newzbin and nzbmatrix links (no need to parse out the ID).
    #
    # Added in 0.3
    # Priority added in 0.5
    #
    # @example Shortest
    #   addurl({:name => "http://www.example.com/example.nzb", :nzbname=> "NiceName" })
    # @example Full
    #   addurl({:name=>"http://www.example.com/example.nzb", :pp=> 3, :script=>"customscript.cmd", :cat=>"Example", :priority=>-1, :nzbname=>"NiceName"})
    #
    # @param [Hash] options the options to make the call with.
    # @option options [String] :name
    # @option options [String] :nzbname
    # @option options [String] :pp
    # @option options [String] :script
    # @option options [String] :cat
    # @option options [String] :priority
    #
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def addurl(options = {})
      return @caller.call("addurl", options)
    end

    # pp, script, cat and priority are all optional. This example will retrieve
    # the newzbin post "33333" and instert it at low priority in the queue,
    # assigned with a categoriy of "Example", to execute "customscript.cmd" once
    #  finished, and with the unpacking option 3 (Repair, Unpack and Delete)
    #
    # Added in 0.3
    # Priority added in 0.5
    #
    # @example Full
    #   addid({:name=>333333, :pp=> 3, :script=>"customscript.cmd", :cat=>"Example", :priority=>-1})
    #
    # @param [Hash] options the options to make the call with.
    # @option options [String] :name
    # @option options [String] :pp
    # @option options [String] :script
    # @option options [String] :cat
    # @option options [String] :priority
    #
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def addid(options = {})
      return @caller.call("addid", options)
    end

    # Allows uploading of nzb/rar/zip/gz files by simply providing a local path 
    # (has to be accessable by the machine running SABnzbd
    #
    # Added in 0.3
    # Priority added in 0.5
    #
    # @example Example
    #   addlocalfile({:name=>"full/local/path/to/file.ext", :pp=> 1, :script=>"script.cmd", :priority=>-1})
    #
    # @param [Hash] options the options to make the call with.
    # @option options [String] :name
    # @option options [String] :pp
    # @option options [String] :script
    # @option options [String] :cat
    # @option options [String] :priority
    #
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def addlocalfile(options = {})
      return @caller.call("addlocalfile", options)
    end

    # Added in 0.4
    #
    # @example Example
    #   change_script({:value=>"SABnzbd_nzo_zt2syz", :value2=> "examplescript.cmd"})
    #
    # @param [Hash] options the options to make the call with.
    # @option options [String] :value
    # @option options [String] :value2
    #
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def change_script(options = {})
      return @caller.call("change_script", options)
    end

    # Added in 0.4
    #
    # @example Example
    #   change_cat({:value=>"SABnzbd_nzo_zt2syz", :value2=> "Example"})
    #
    # @param [Hash] options the options to make the call with.
    # @option options [String] :value
    # @option options [String] :value2
    #
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def change_cat(options = {})
      return @caller.call("change_cat", options)
    end

    # Change value2 to control what post-processing option to use
    #
    # Added in 0.5
    # 
    # @example Example
    #   change_opts({:value=>"SABnzbd_nzo_zt2syz", :value2=> 0})
    # Skip: 0
    # Repair: 1
    # Repair/Unpack: 2
    # Repair/Unpack/Delete: 3
    #
    #
    # @param [Hash] options the options to make the call with.
    # @option options [String] :value
    # @option options [String] :value2
    #
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def change_opts(options = {})
      return @caller.call("change_opts", options)
    end

    # Retrieve Contents of Queue item
    #
    # Added in 0.5
    #
    # @example Example
    #   get_files({:value=>"SABnzbd_nzo_zt2syz"})
    #
    # @param [Hash] options the options to make the call with.
    # @option options [String] :value
    #
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def get_files(options = {})
      return @caller.call("get_files", options)
    end

    # Added in 0.6.0
    # Retry a single item
    #
    # @example Example
    #   retry({:value=>"SABnzbd_nzo_zt2syz"})
    #
    # @param [Hash] options the options to make the call with.
    # @option options [String] :value
    #
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def retry(options = {})
      return @caller.call("retry", options)
    end
  end
end
