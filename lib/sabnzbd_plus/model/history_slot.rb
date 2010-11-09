$:.unshift File.join(File.dirname(__FILE__),'..','..','..','lib')

require 'sabnzbd_plus/model/slot'
require 'sabnzbd_plus/model/stage_log'

module SabnzbdPlusModel
  class HistorySlot < Slot

    attr_accessor :action_line, :show_details, :script_log, :meta
    attr_accessor :loaded, :id, :category, :pp, :completeness, :fail_message
    attr_accessor :nzb_name, :download_time, :storage, :script_line, :filename
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
      item.filename        = slot["filename"]

      slot["stage_log"].each { |log|
        item.stage_log = item.stage_log << StageLog.from_hash(log)
      } if slot.key? "stage_log"

      return item
    end

    def ==(item)

      unless(
        item.action_line    == self.action_line &&
        item.show_details   == self.show_details &&
        item.script_log     == self.script_log &&
        item.meta           == self.meta &&
        item.loaded         == self.loaded &&
        item.id             == self.id &&
        item.category       == self.category &&
        item.filename       == self.filename &&
        item.pp             == self.pp &&
        item.completeness   == self.completeness &&
        item.fail_message   == self.fail_message &&
        item.nzb_name       == self.nzb_name &&
        item.download_time  == self.download_time &&
        item.script_line    == self.script_line &&
        item.completed      == self.completed &&
        item.downloaded     == self.downloaded &&
        item.report         == self.report &&
        item.path           == self.path &&
        item.stage_log      == self.stage_log &&
        item.post_proc_time == self.post_proc_time &&
        item.name           == self.name &&
        item.url            == self.url &&
        item.bytes          == self.bytes &&
        item.url_info       == self.url_info &&
        item.storage        == self.storage)

        return false
      end

      return super item
    end

    def eql?(item)
      return (item.class == self.class && self == item)
    end
  end
end
