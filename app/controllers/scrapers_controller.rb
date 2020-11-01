class ScrapersController < ApplicationController
  def index
  end

  def new
    scraping
  end

  def create
    @reserves = Reservation.all
    @reserves.each do |reserve|
      p "#{reserve.day_of_week}"
      p "#{reserve.room}"
    end
  end

  def scraping
    @reserves = Reservation.all
    @reserves.each do |reserve|
      require 'selenium-webdriver'
      daily_s = "2021年05月01日" 
      daily_e = "2021年05月31日"

      i = reserve.day_of_week
      if i == "日"
        @day = 1
      elsif i == "月"
        @day = 2
      elsif i == "火"
        @day = 3
      elsif i == "水"
        @day = 4
      elsif i == "木"
        @day = 5
      elsif i == "金"
        @day = 6
      elsif i == "土"
        @day = 7
      end

      if reserve.room ==  "U01"
        @room = 1
      elsif reserve.room == "U02"
        @room = 2
      elsif reserve.room == "U04"
        @room = 3
      elsif reserve.room == "U05"
        @room = 4
      elsif reserve.room == "U06"
        @room = 5
      elsif reserve.room == "U07"
        @room = 6
      elsif reserve.room == "U09"
        @room = 7
      elsif reserve.room == "U10"
        @room = 8
      elsif reserve.room == "U11"
        @room = 9
      elsif reserve.room == "703"
        @room = 10
      elsif reserve.room == "704"
        @room = 11
      elsif reserve.room == "802"
        @room = 12
      elsif reserve.room == "803"
        @room = 13
      elsif reserve.room == "809"
        @room = 14
      elsif reserve.room == "810"
        @room = 15
      elsif reserve.room == "811"
        @room = 16
      elsif reserve.room == "814"
        @room = 17
      elsif reserve.room == "815"
        @room = 18
      elsif reserve.room == "903"
        @room = 19
      elsif reserve.room == "908"
        @room = 20
      elsif reserve.room == "909"
        @room = 21
      elsif reserve.room == "U08"
        @room = 22
      elsif reserve.room == "806"
        @room = 23
      elsif reserve.room == "807"
        @room = 24
      elsif reserve.room == "813"
        @room = 25
      elsif reserve.room == "905"
        @room = 26
      elsif reserve.room == "U03"
        @room = 27
      elsif reserve.room == "808"
        @room = 28
      elsif reserve.room == "812"
        @room = 29
      elsif reserve.room == "910"
        @room = 30
      elsif reserve.room == "804"
        @room = 31
      elsif reserve.room == "805"
        @room = 32
      elsif reserve.room == "902"
        @room = 33
      elsif reserve.room == "907"
        @room = 34
      elsif reserve.room == "801"
        @room = 35
      elsif reserve.room == "901"
        @room = 36
      elsif reserve.room == "904"
        @room = 37
      elsif reserve.room == "906"
        @room = 38
      elsif reserve.room == "702"
        @room = 39
      elsif reserve.room == "701"
        @room = 40
      end

      if reserve.time_s == "9:00"
        @time_s = 1
      elsif reserve.time_s == "9:30"
        @time_s = 2
      elsif reserve.time_s == "10:00"
        @time_s = 3
      elsif reserve.time_s == "10:30"
        @time_s = 4
      elsif reserve.time_s == "11:00"
        @time_s = 5
      elsif reserve.time_s == "11:30"
        @time_s = 6
      elsif reserve.time_s == "12:00"
        @time_s = 7
      elsif reserve.time_s == "12:30"
        @time_s = 8
      elsif reserve.time_s == "13:00"
        @time_s = 9
      elsif reserve.time_s == "13:30"
        @time_s = 10
      elsif reserve.time_s == "14:00"
        @time_s = 11
      elsif reserve.time_s == "14:30"
        @time_s = 12
      elsif reserve.time_s == "15:00"
        @time_s = 13
      elsif reserve.time_s == "15:30"
        @time_s = 14
      elsif reserve.time_s == "16:00"
        @time_s = 15
      elsif reserve.time_s == "16:30"
        @time_s = 16
      elsif reserve.time_s == "17:00"
        @time_s = 17
      elsif reserve.time_s == "17:30"
        @time_s = 18
      elsif reserve.time_s == "18:00"
        @time_s = 19
      elsif reserve.time_s == "18:30"
        @time_s = 20
      elsif reserve.time_s == "19:00"
        @time_s = 21
      elsif reserve.time_s == "19:30"
        @time_s = 22
      elsif reserve.time_s == "20:00"
        @time_s = 23
      elsif reserve.time_s == "20:30"
        @time_s = 24
      elsif reserve.time_s == "21:00"
        @time_s = 25
      elsif reserve.time_s == "21:30"
        @time_s = 26
      elsif reserve.time_s == "22:00"
        @time_s = 27
      elsif reserve.time_s == "22:30"
        @time_s = 28
      elsif reserve.time_s == "23:00"
        @time_s = 29
      elsif reserve.time_s == "23:30"
        @time_s = 30
      elsif reserve.time_s == "24:00"
        @time_s = 31
      end

      if reserve.time_e == "9:00"
        @time_e = 0
      elsif reserve.time_e == "9:30"
        @time_e = 1
      elsif reserve.time_e == "10:00"
        @time_e = 2
      elsif reserve.time_e == "10:30"
        @time_e = 3
      elsif reserve.time_e == "11:00"
        @time_e = 4
      elsif reserve.time_e == "11:30"
        @time_e = 5
      elsif reserve.time_e == "12:00"
        @time_e = 6
      elsif reserve.time_e == "12:30"
        @time_e = 7
      elsif reserve.time_e == "13:00"
        @time_e = 8
      elsif reserve.time_e == "13:30"
        @time_e = 9
      elsif reserve.time_e == "14:00"
        @time_e = 10
      elsif reserve.time_e == "14:30"
        @time_e = 11
      elsif reserve.time_e == "15:00"
        @time_e = 12
      elsif reserve.time_e == "15:30"
        @time_e = 13
      elsif reserve.time_e == "16:00"
        @time_e = 14
      elsif reserve.time_e == "16:30"
        @time_e = 15
      elsif reserve.time_e == "17:00"
        @time_e = 16
      elsif reserve.time_e == "17:30"
        @time_e = 17
      elsif reserve.time_e == "18:00"
        @time_e = 18
      elsif reserve.time_e == "18:30"
        @time_e = 19
      elsif reserve.time_e == "19:00"
        @time_e = 20
      elsif reserve.time_e == "19:30"
        @time_e = 21
      elsif reserve.time_e == "20:00"
        @time_e = 22
      elsif reserve.time_e == "20:30"
        @time_e = 23
      elsif reserve.time_e == "21:00"
        @time_e = 24
      elsif reserve.time_e == "21:30"
        @time_e = 25
      elsif reserve.time_e == "22:00"
        @time_e = 26
      elsif reserve.time_e == "22:30"
        @time_e = 27
      elsif reserve.time_e == "23:00"
        @time_e = 28
      elsif reserve.time_e == "23:30"
        @time_e = 29
      elsif reserve.time_e == "24:00"
        @time_e = 30
      end

      if reserve.option == "ブルーレイデッキ"
        @option = 2
      elsif reserve.option == "ワイヤレスマイク"
        @option = 3
      elsif reserve.option == "DJセット"
        @option = 4
      elsif reserve.option == "マイク"
        @option = 5
      elsif reserve.option == "長机"
        @option = 6
      elsif reserve.option == "椅子"
        @option = 7
      elsif reserve.option == "ホワイトボード"
        @option = 8
      elsif reserve.option == "譜面台"
        @option = 9
      elsif reserve.option == "マイクスタンド"
        @option = 10
      elsif reserve.option == "タップ板"
        @option = 11
      elsif reserve.option == "ヨガマット"
        @option = 12
      elsif reserve.option == "キーボード"
        @option = 13
      elsif reserve.option == "パーテーション"
        @option = 14
      elsif reserve.option == "バレエバー3m"
        @option = 15
      elsif reserve.option == "バレエバー6m"
        @option = 16
      elsif reserve.option == "リングライト"
        @option = 21
      elsif reserve.option == "カラーライト"
        @option = 22
      elsif reserve.option == "フロント台"
        @option = 23
      end

      #--------------------------------------------------------------
      number = $number                        #会員番号
      name = $name                  #名前
      day = $day                              #曜日
      room = $room                             #スタジオ
      time_s = $time_s                           #予約開始
      time_e = $time_e                           #予約終了
      month = 6                            #更新月
      @week = 0         #何周目か
      #--------------------------------------------------------------
      client = Selenium::WebDriver::Remote::Http::Default.new
      client.read_timeout = 60000
      chrome_capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
          chromeOptions: {
             args: ["--headless", "--no-sandbox"],
            w3c: false
          }
        )
      begin
        d = Selenium::WebDriver.for(
          :remote,
          url: "http://selenium-server:4444/wd/hub",
          desired_capabilities: chrome_capabilities,
          http_client: client
        )
        d.get "https://resv.studio-mission.com/admin/login"
        sleep 1
      rescue
        retry
      end

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
      number_blank.send_key(reserve.customer.number)
      d.find_element(:class, 'btn').click
      sleep 1
      d.find_element(:xpath, '/html/body/div/div[3]/div/table/tbody/tr/td[2]/a').click
      sleep 1
      d.find_element(:class, 'btn-login').click
      sleep 1
      puts "
        --------------------------------------
        #{reserve.customer.customername}にログインしました！
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
      begin
        if reserve.count == "毎週"
          sleep 1
          i = 6
          i.times{| num |
            @week += 1
            d.execute_script('window.scroll(1000,0);')
            sleep 1
            d.find_element(:class, 'fa-calendar').click
            sleep 1
            month.times{| num |
              d.find_element(:class, 'picker__nav--next').click
            }
            d.find_element(:xpath, "/html/body/div[2]/div/div/div[1]/div[2]/div/div/div/div/div/table/tbody/tr[#{@week}]/td[#{@day}]/div").click
            a = daily_s.delete("^0-9")
            b = daily_e.delete("^0-9")
            c = d.current_url.delete("^0-9")
            if a <= c && c <= b
              sleep 1
              d.find_element(:xpath, "/html/body/div[2]/div/div/div[3]/ul[#{@room}]/li[#{@time_s}]/label").click
              sleep 1
              d.find_element(:xpath , "/html/body/div[2]/div/div/div[3]/ul[#{@room}]/li[#{@time_e}]/label").click
              sleep 1
              d.execute_script('window.scroll(0,1000);')
              sleep 1
              d.find_element(:xpath, '/html/body/div[2]/div/div/form/div[2]/ul/li/button').click
              sleep 1
              if reserve.option.blank? == false
                select = Selenium::WebDriver::Support::Select.new(d.find_element(:name, "params[options][#{@option}]"))
                select.select_by(:value, "#{reserve.number_of_option}")
              end
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
              d.find_element(:xpath, "/html/body/div[2]/div/div/div[1]/div[2]/div/div/div/div/div/table/tbody/tr[2]/td[#{@day}]/div").click
            end
          }
          puts "
          ------------------------------------------------------------------------
          #{reserve.customer.number}:#{reserve.customer.customername} #{reserve.day_of_week}曜日 #{reserve.time_s}〜#{reserve.time_e}の予約が完了しました。
          -------------------------------------------------------------------------"
          d.quit
        elsif reserve.count == "毎週(5週目なし)"
          sleep 1
          i = 5
          i.times{| num |
            if @week <= 5
              @week += 1
              d.execute_script('window.scroll(1000,0);')
              sleep 1
              d.find_element(:class, 'fa-calendar').click
              sleep 1
              month.times{| num |
                d.find_element(:class, 'picker__nav--next').click
              }
              d.find_element(:xpath, "/html/body/div[2]/div/div/div[1]/div[2]/div/div/div/div/div/table/tbody/tr[#{@week}]/td[#{@day}]/div").click
              a = daily_s.delete("^0-9")
              b = daily_e.delete("^0-9")
              c = d.current_url.delete("^0-9")
              if a <= c && c <= b
                sleep 1
                d.find_element(:xpath, "/html/body/div[2]/div/div/div[3]/ul[#{@room}]/li[#{@time_s}]/label").click
                sleep 1
                d.find_element(:xpath , "/html/body/div[2]/div/div/div[3]/ul[#{@room}]/li[#{@time_e}]/label").click
                sleep 1
                d.execute_script('window.scroll(0,1000);')
                sleep 1
                d.find_element(:xpath, '/html/body/div[2]/div/div/form/div[2]/ul/li/button').click
                sleep 1
                if reserve.option.blank? == false
                  select = Selenium::WebDriver::Support::Select.new(d.find_element(:name, "params[options][#{@option}]"))
                  select.select_by(:value, "#{reserve.number_of_option}")
                end
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
                d.find_element(:xpath, "/html/body/div[2]/div/div/div[1]/div[2]/div/div/div/div/div/table/tbody/tr[2]/td[#{@day}]/div").click
              end
            end
          }
          puts "
          ------------------------------------------------------------------------
          #{reserve.customer.number}:#{reserve.customer.customername} #{reserve.day_of_week}曜日 #{reserve.time_s}〜#{reserve.time_e}の予約が完了しました。
          -------------------------------------------------------------------------"
          d.quit
        elsif reserve.count == "第1,3,5週"
          sleep 1
          i = 4
          i.times{| num |
            @week += 1
            d.execute_script('window.scroll(1000,0);')
            sleep 1
            d.find_element(:class, 'fa-calendar').click
            sleep 1
            month.times{| num |
              d.find_element(:class, 'picker__nav--next').click
            }
            d.find_element(:xpath, "/html/body/div[2]/div/div/div[1]/div[2]/div/div/div/div/div/table/tbody/tr[#{@week}]/td[#{@day}]/div").click
            a = daily_s.delete("^0-9")
            b = daily_e.delete("^0-9")
            c = d.current_url.delete("^0-9")
            if a <= c && c <= b
              sleep 1
              d.find_element(:xpath, "/html/body/div[2]/div/div/div[3]/ul[#{@room}]/li[#{@time_s}]/label").click
              sleep 1
              d.find_element(:xpath , "/html/body/div[2]/div/div/div[3]/ul[#{@room}]/li[#{@time_e}]/label").click
              sleep 1
              d.execute_script('window.scroll(0,1000);')
              sleep 1
              d.find_element(:xpath, '/html/body/div[2]/div/div/form/div[2]/ul/li/button').click
              sleep 1
              if reserve.option.blank? == false
                select = Selenium::WebDriver::Support::Select.new(d.find_element(:name, "params[options][#{@option}]"))
                select.select_by(:value, "#{reserve.number_of_option}")
              end
              sleep 1
              d.find_element(:name, 'confirm').click
              sleep 1
              d.find_element(:class, 'btn-reserve').click
              sleep 1
              d.find_element(:xpath, '/html/body/div/div/div/div[3]/ul/li[3]/a').click
              sleep 1
              @week += 1
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
              d.find_element(:xpath, "/html/body/div[2]/div/div/div[1]/div[2]/div/div/div/div/div/table/tbody/tr[2]/td[#{@day}]/div").click
            end
          }
          puts "
          ------------------------------------------------------------------------
          #{reserve.customer.number}:#{reserve.customer.customername} #{reserve.day_of_week}曜日 #{reserve.time_s}〜#{reserve.time_e}の予約が完了しました。
          -------------------------------------------------------------------------"
          d.quit
        elsif reserve.count == "第2,4週"
          sleep 1
          i = 4
          i.times{| num |
            @week += 2
            d.execute_script('window.scroll(1000,0);')
            sleep 1
            d.find_element(:class, 'fa-calendar').click
            sleep 1
            month.times{| num |
              d.find_element(:class, 'picker__nav--next').click
            }
            d.find_element(:xpath, "/html/body/div[2]/div/div/div[1]/div[2]/div/div/div/div/div/table/tbody/tr[#{@week}]/td[#{@day}]/div").click
            a = daily_s.delete("^0-9")
            b = daily_e.delete("^0-9")
            c = d.current_url.delete("^0-9")
            if a <= c && c <= b
              sleep 1
              d.find_element(:xpath, "/html/body/div[2]/div/div/div[3]/ul[#{@room}]/li[#{@time_s}]/label").click
              sleep 1
              d.find_element(:xpath , "/html/body/div[2]/div/div/div[3]/ul[#{@room}]/li[#{@time_e}]/label").click
              sleep 1
              d.execute_script('window.scroll(0,1000);')
              sleep 1
              d.find_element(:xpath, '/html/body/div[2]/div/div/form/div[2]/ul/li/button').click
              sleep 1
              if reserve.option.blank? == false
                select = Selenium::WebDriver::Support::Select.new(d.find_element(:name, "params[options][#{@option}]"))
                select.select_by(:value, "#{reserve.number_of_option}")
              end
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
              d.find_element(:xpath, "/html/body/div[2]/div/div/div[1]/div[2]/div/div/div/div/div/table/tbody/tr[2]/td[#{@day}]/div").click
              r = 1
            end
          }
          puts "
          ------------------------------------------------------------------------
          #{reserve.customer.number}:#{reserve.customer.customername} #{reserve.day_of_week}曜日 #{reserve.time_s}〜#{reserve.time_e}の予約が完了しました。
          -------------------------------------------------------------------------"
          sleep 10

          d.quit
        end
      rescue
        d.quit
      end
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:number, :customername, :email, :profile )
  end
end

