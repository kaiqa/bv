
    def i_take_a_screen_shot
     filename = DateTime.now.strftime("%d%b%Y%H%M%S")
     @browser.screenshot.save ("scrcap/ #{filename}.png")
    end
  
    def i_click_on_the_start_button
    @browser.button(id: "jfCard-welcome-start").click
    i_report(caseName: 'i_click_on_the_start_button', passed: 'yes')
    end

    def i_fill_in_name
    @browser.text_field(id: 'first_3').set("testUserFirst")
    @browser.text_field(id: 'last_3').set("testUserLast")
    i_report(caseName: 'i_fill_in_name', passed: 'yes')
    end

    def i_fill_in_last_name
    @browser.text_field(id: 'last_3').set("testUserLast")
    i_report(caseName: 'i_fill_in_last_name', passed: 'yes')
    end

    def i_select_button_next
    @browser.element(:xpath => "//button[2]").click
    i_report(caseName: 'i_select_button_next', passed: 'yes')
    end

    def i_upload_a_rtf_file
    filePath = File.dirname(__FILE__) + '/testfile.rtf'
    @browser.file_field.set filePath
    i_report(caseName: 'i_upload_a_rtf_file', passed: 'yes')
    end

    def i_draw_my_signature_and_click_next
    element = @browser.driver.find_element(:id, 'signature_pad_7')
    @browser.driver.action.move_to(element, 50, 50).click.perform
    @browser.driver.action.click_and_hold(element).move_by(150, 50).perform
    @browser.driver.action.move_to(element).click.perform
    @browser.element(:xpath => "/html/body/div[5]/form/ul/li[3]/div/div/div[3]/button[2]").click
    i_report(caseName: 'i_upload_a_rtf_file', passed: 'yes')
    end

    def i_fill_in_the_date_field_and_click_next
    @browser.text_field(id: 'lite_mode_6').set("16-02-2007")
    @browser.driver.find_element(:xpath => "//li[4]/div/div/div[3]/button[2]").click
    i_report(caseName: 'i_fill_in_the_date_field_and_click_next', passed: 'yes')
    end

    def i_fill_in_the_security_question_and_click_next
    @browser.driver.find_element(:xpath => "//li[5]/div/div/div[2]/div[3]/div[1]/div[1]/div/div").click
    @browser.driver.find_element(:xpath => "//li[5]/div/div/div[2]/div[3]/div[1]/div[2]/ul/li[4]").click
    @browser.text_field(id: 'input_10_field_2').set("professor x")
    i_report(caseName: 'i_fill_in_the_security_question_and_click_next', passed: 'yes')
    end

    def i_confirm_and_send_the_form
    @browser.element(:xpath => "//li[5]/div/div/div[3]/button[3]").click
    i_report(caseName: 'i_confirm_and_send_the_form', passed: 'yes')
    end
    def i_see_the_confirmation_page
    @browser.element(:xpath => "//div[3]/div/div/div[2]").text.match(/Your submission has been received!/)
    i_report(caseName: 'i_see_the_confirmation_page', passed: 'yes')
    end

    def i_report(caseName:, passed:)
        fileHtml = File.new("report.html", "a+")
        dateTime = Time.now
        platform = @this_browser
        browser =  'chrome--'
        failed = failed
        case_name = caseName
        pass = passed

        fileHtml.write <<EOH
<HTML>
<HEAD>
<style media='all' type='text/css'>
body {font-family: Helvetica Neue, sans-serif; font-size: 18px; color: #525252; padding: 0; margin: 0;background: #f2f2f2;}
.content {max-width:1180px; padding: 40px;}
.div1 {margin-top: 28px; margin-bottom: 1px; background-color: #fff; padding: 10px 40px; padding-bottom: 8px; }
.div2 {margin-top: 2px; height:25%; margin-bottom: 28px; background-color: #fff; padding: 10px 40px; padding-bottom: 8px; }
.header {background-color: white; height: 16%; min-height: 110px; position: relative; width: 100%; -webkit-user-select: none;}
.secondSection {background-color: #e8e8e8; height: 16%; min-height: 110px; position: relative; width: 100%; -webkit-user-select: none;}
.pass {color: #ffffff; background: #34d9a2; padding: 10px 20px 10px 20px; text-decoration: none; width:50px;}
.fail {color: #ffffff; background: #f25e6a; padding: 10px 20px 10px 20px; text-decoration: none; width:50px;}
</style>
</HEAD>
<BODY>
<DIV class='header'><img src='logo.png' alt='logo'></div>
<DIV class='secondSection'><p>#{dateTime}</p><p>#{platform}</p><p>#{browser}</p></div>
<DIV class='content'>
<DIV class='div1'><h2>Test Case: #{case_name} </h2></DIV>
<DIV class='div2'><p class='pass'>#{pass}</p></DIV>
</DIV>
</BODY></HTML>
EOH

fileHtml.close()
    end