require 'webdrivers'
require 'watir'
require 'logger'
require_relative "./helper.rb"

class TestForm
  def initialize(this_browser)  
    $log = Logger.new('report.log', 'daily')
    browser_type, *site = ARGV
    @browser = Watir::Browser.new(this_browser)
    @browser.goto(site[0])
    @browser.div(id: "header_welcomePage").text.match(/Test Form/)
    $log.info("** BROWSER **")
    $log.info(this_browser)
    $log.info("** URL **")
    $log.info(site[0])
    fileHtml = File.new("filename.html", "w+")
  end
  
  def form_test
    begin
    i_click_on_the_start_button
    i_fill_in_name
    i_fill_in_last_name
    i_select_button_next
    i_upload_a_rtf_file
    i_select_button_next
    i_draw_my_signature_and_click_next
    i_fill_in_the_date_field_and_click_next
    i_fill_in_the_security_question_and_click_next
    i_confirm_and_send_the_form
    i_see_the_confirmation_page
    i_take_a_screen_shot
    rescue Watir::Exception::UnknownObjectException  => ex
    i_take_a_screen_shot
    $log.info(ex.message)
    $log.info(ex.backtrace)
    i_report(caseName: ex.message , passed: 'no')
    ensure
      @browser.close
    end
  end
 end

runner = TestForm.new(ARGV[0].to_sym)
runner.form_test
