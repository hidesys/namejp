require "sinatra"
require "haml"
require "yaml"

before do
  data_yml = <<EOS
comicpenis.com:
  title: 漫画に出てくるちんぽの総合レビューサイト
  name: コミックペニスドットコム
  description: 漫画に出てくるちんぽの総合レビューサイト「コミックペニスドットコム」の予定地です。
  image: comic
xn--t8j3ba3rb.xn--ebkw96v.jp:
  title: 男根妄執者交友の場
  name: おちんちん舐めットワーク
  description: 男根妄執者交友の場「おちんちん舐めットワーク」の予定地です。
  image: soine
xn--mdko7i337m95za.tokyo:
  title: 完全合法の快楽
  name: 合法おちんちん
  description: どう考えたって涎が垂れる。
  image: name
xn--qckubr2ko55p5byf.tokyo:
  title: 危険すぎる快楽
  name: 危険おちんちん
  description: 異常な妄執があなたを襲う！
  image: default
xn--qckubr2ks903aqsza.tokyo:
  title: 脱法水準の快楽
  name: 脱法おちんちん
  description: おおおおちんちん舐めたいようううううう。。。
  image: named
chinko.tokyo:
  title: 東京みやげには「東京ちんこ」
  name: 東京ちんこ
  description: 「東京ちんこ」のオフィシャルオンラインショップです。
  image: named
dankon.tokyo:
  title: 東京より妄執をお届けします
  name: 東京男根物語
  description: 銘菓「東京男根物語」のオフィシャルオンラインショップです。
  image: named
unv.tokyo:
  title: 各大学のサークルメンバーのちんこ情報が盛り沢山！
  name: 大学サークル陰茎情報＠東京
  description: 「大学サークル陰茎情報＠東京」予定地。
  image: makura
universityof.tokyo:
  title: 各大学のサークルメンバーのちんこ情報が盛り沢山！
  name: 大学サークル陰茎情報＠東京
  description: 「大学サークル陰茎情報＠東京」予定地。
  image: makura
theuniversityof.tokyo:
  title: 各大学のサークルメンバーのちんこ情報が盛り沢山！
  name: 大学サークル陰茎情報＠東京
  description: 「大学サークル陰茎情報＠東京」予定地。
  image: makura
EOS
  @data = YAML.load(data_yml)
end

get "/" do
  #ドメインがあるかのチェック
  if !@data.has_key?(request.host)
    redirect "http://xn--t8j3ba3rb.xn--ebkw96v.jp/", "存在しないドメイン"
    return
  end

  site = @data[request.host]
  @title = site["title"]
  @name = site["name"]
  @image_file = "#{site["image"]}.png"
  @description = site["description"]
  haml :index
end
