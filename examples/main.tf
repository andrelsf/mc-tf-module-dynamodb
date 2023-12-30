module "dynamodb" {
  source        = "git::https://github.com/andrelsf/mc-tf-module-dynamodb.git?ref=1.0.0"
  table_name    = "orders"
  billing_mode  = "PAY_PER_REQUEST"
  hash_key = {
    name = "order_id"
    type = "S"
  }
  use_range_key = true
  range_key = {
    name = "user_id"
    type = "S"
  }
}