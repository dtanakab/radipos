# frozen_string_literal: true

require "csv"
require "charlock_holmes"

Program.all.each do |program|
  program.corners.create(
    title: "ふつおた（普通のお便り）/テーマメール/リアクションメール",
    subject: "ふつおた/テーマメール/リアクションメール",
    introduction: "XXXXさん、こんばんは！
    \n今日のテーマは、「明日絶対にやりたいこと」ですが、
    \n〜は絶対にやりたいと思っています！
    \nXXXXさんは、〜をどうしていますか？",
    alive_flag: 1,
    unpostable_reason: nil
  )
end
