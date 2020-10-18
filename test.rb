
class ReservationsController
  def test
    require 'selenium-webdriver'
    require "./customers/example.rb"

    daily_s = "2021年03月01日" 
    daily_e = "2021年03月31日"
    --------------------------------------------------------------
    number = $number                        #会員番号
    name = $name                  #名前
    day = $day                              #曜日
    room = $room                             #スタジオ
    time_s = $time_s                           #予約開始
    time_e = $time_e                           #予約終了
    month = $mounth                            #更新月
    i = $i                                #連続何回取るか
    week = $week
    --------------------------------------------------------------


    # 曜日
    #  Sunday = 1
    #  Monday = 2
    #  Tuesday = 3
    #  Wednesday = 4
    #  Thursday = 5
    #  Friday = 6
    #  Saturday = 7


    # Room number 
    # A_U01 = 1
    # A_U02 = 2
    # A_U04 = 3
    # A_U05 = 4
    # A_U06 = 5
    # A_U07 = 6
    # A_U09 = 7
    # A_U10 = 8
    # A_U11 = 9
    # A_703 = 10
    # A_704 = 11
    # A_802 = 12
    # A_803 = 13
    # A_809 = 14
    # A_810 = 15
    # A_811 = 16
    # A_814 = 17
    # A_815 = 18
    # A_903 = 19
    # A_908 = 20
    # A_909 = 21
    # B_U08 = 22
    # B_806 = 23
    # B_807 = 24
    # B_813 = 25
    # B_905 = 26
    # C_U03 = 27
    # C_808 = 28
    # C_812 = 29
    # C_910 = 30
    # D_804 = 31
    # D_805 = 32
    # D_902 = 33
    # D_907 = 34
    # E_801 = 35
    # E_901 = 36
    # D_904 = 37
    # G_906 = 38
    # H_702 = 39
    # J_701 = 40

    #Time
    # 09h00_09h30 = 1
    # 09h30_10h00 = 2
    # 10h00_10h30 = 3
    # 10h30_11h00 = 4
    # 11h00_11h30 = 5
    # 11h30_12h00 = 6
    # 12h00_12h30 = 7
    # 12h30_13h00 = 8
    # 13h00_13h30 = 9
    # 13h30_14h00 = 10
    # 14h00_14h30 = 11
    # 14h30_15h00 = 12
    # 15h00_15h30 = 13
    # 15h30_16h00 = 14
    # 16h00_16h30 = 15
    # 16h30_17h00 = 16
    # 17h00_17h30 = 17
    # 17h30_18h00 = 18
    # 18h00_18h30 = 19
    # 18h30_19h00 = 20
    # 19h00_19h30 = 21
    # 19h30_20h00 = 22
    # 20h00_20h30 = 23
    # 20h30_21h00 = 24
    # 21h00_21h30 = 25
    # 21h30_22h00 = 26
    # 22h00_22h30 = 27
    # 22h30_23h00 = 28
    # 23h00_23h30 = 29
    # 23h30_24h00 = 30
    # 24h00_ = 31

    wait_time = 600
    timeout = 600


    # Seleniumの初期化
    # class ref: https://www.rubydoc.info/gems/selenium-webdriver/Selenium/WebDriver/Chrome
    Selenium::WebDriver.logger.output = File.join("./", "selenium.log")
    Selenium::WebDriver.logger.level = :warn
    chrome_capabilities = Selenium::WebDriver::Remote::Capabilities.chrome
    d = Selenium::WebDriver.for(
      :remote,
      url: "http://selenium-server:4444/wd/hub",
      desired_capabilities: chrome_capabilities
    )
    d.manage.timeouts.implicit_wait = timeout
    wait = Selenium::WebDriver::Wait.new(timeout: wait_time)
    d.get "http://studiomission.eventcast.co.jp/admin/login"

    #管理画面にログイン
    login_email = d.find_element(:name, 'params[email]')  
    login_email.clear
    login_email.send_key('k1x.heart@icloud.com')

    login_pass = d.find_element(:name, 'params[password]')
    login_pass.clear
    login_pass.send_key('Ts1997522')
    d.find_element(:class, 'btn').click
    sleep 1

    #お客様のアカウントにログイン
    d.find_element(:xpath, '/html/body/div/div[2]/ul/li[6]/a').click
    sleep 1
    number_blank = d.find_element(:xpath, '/html/body/div/div[3]/div/div[1]/form/table/tbody/tr[1]/td/input')
    number_blank.clear
    number_blank.send_key(number)
    d.find_element(:class, 'btn').click
    sleep 1
    d.find_element(:link, name).click
    sleep 1
    d.find_element(:class, 'btn-login').click
    sleep 1
    puts "
      --------------------------------------
      #{name}にログインしました！
      --------------------------------------"

    #予約画面に移動
    window = d.window_handles.last
    d.switch_to.window(window)
    d.execute_script('window.scroll(0,1000);')
    sleep 1
    d.find_element(:class, 'btn-reserve').click
    puts "
      -----------------
      予約を開始します。
      -----------------"
    #-----------------------------------------------------------------------------------------------------------------------------------------
    #予約開始

    sleep 1
    i.times{| num |
      week += 1
      d.execute_script('window.scroll(1000,0);')
      sleep 1
      d.find_element(:class, 'fa-calendar').click
      sleep 1
      month.times{| num |
        d.find_element(:class, 'picker__nav--next').click
      }
      d.find_element(:xpath, "/html/body/div[2]/div/div/div[1]/div[2]/div/div/div/div/div/table/tbody/tr[#{week}]/td[#{day}]/div").click
      a = daily_s.delete("^0-9")
      b = daily_e.delete("^0-9")
      c = d.current_url.delete("^0-9")
      puts a
      puts b
      puts c 
      if a <= c && c <= b
        sleep 1
        d.find_element(:xpath, "/html/body/div[2]/div/div/div[3]/ul[#{room}]/li[#{time_s}]/label").click
        sleep 1
        d.find_element(:xpath , "/html/body/div[2]/div/div/div[3]/ul[#{room}]/li[#{time_e}]/label").click
        sleep 1
        d.execute_script('window.scroll(0,1000);')
        sleep 1
        d.find_element(:xpath, '/html/body/div[2]/div/div/form/div[2]/ul/li/button').click
        sleep 1
        d.find_element(:name, 'confirm').click
        sleep 1
        d.find_element(:class, 'btn-reserve').click
        sleep 1
        d.find_element(:xpath, '/html/body/div/div/div/div[3]/ul/li[3]/a').click
        sleep 1
      elsif b < c
        d.quit
        break
      else
        d.execute_script('window.scroll(1000,0);')
        sleep 1
        d.find_element(:class, 'fa-calendar').click
        sleep 1
        5.times{| num |
          d.find_element(:class, 'picker__nav--prev').click
        }
        sleep 1
        d.find_element(:xpath, "/html/body/div[2]/div/div/div[1]/div[2]/div/div/div/div/div/table/tbody/tr[2]/td[#{day}]/div").click
      end
    }
    puts "
    --------------------------
    定期予約を更新しました！
    --------------------------"
    d.quit
  end
end



