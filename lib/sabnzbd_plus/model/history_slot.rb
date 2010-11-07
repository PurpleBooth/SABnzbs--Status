$:.unshift File.join(File.dirname(__FILE__),'..','..','..','lib')

require 'sabnzbd_plus/model/slot'
require 'sabnzbd_plus/model/stage_log'

module SabnzbdPlusModel
  class HistorySlot < Slot

    attr_accessor :action_line, :show_details, :script_log, :meta
    attr_accessor :loaded, :id, :category, :pp, :completeness, :fail_message
    attr_accessor :nzb_name, :download_time, :storage, :script_line
    attr_accessor :completed, :downloaded, :report, :path, :stage_log
    attr_accessor :post_proc_time, :name, :url, :bytes, :url_info


    def initialize
      self.stage_log = []
    end

    def self.from_hash(slot)
      item = super slot
      
      item.action_line     = slot["action_line"]
      item.show_details    = slot["show_details"]
      item.script_log      = slot["script_log"]
      item.meta            = slot["meta"]
      item.fail_message    = slot["fail_message"]
      item.loaded          = slot["loaded"]
      item.id              = slot["id"]
      item.category        = slot["category"]
      item.pp              = slot["pp"]
      item.completeness    = slot["completeness"]
      item.nzb_name        = slot["nzb_name"]
      item.download_time   = slot["download_time"]
      item.storage         = slot["storage"]
      item.script_line     = slot["script_line"]
      item.completed       = slot["completed"]
      item.downloaded      = slot["downloaded"]
      item.report          = slot["report"]
      item.path            = slot["path"]
      item.post_proc_time  = slot["postproc_time"]
      item.name            = slot["name"]
      item.url             = slot["url"]
      item.bytes           = slot["bytes"]
      item.url_info        = slot["url_info"]

      slot["stage_log"].each { |log|
        item.stage_log = item.stage_log << StageLog.from_hash(log)
      }

      return item
    end
  end
end
