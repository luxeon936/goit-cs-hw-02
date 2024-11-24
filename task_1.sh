websites=("https://google.com" "https://facebook.com" "https://twitter.com")

log_file="website_status.log"

> "$log_file"

for website in "${websites[@]}"; do
  response=$(curl -o /dev/null -s -w "%{http_code}" -L "$website")
  
  if [ "$response" -eq 200 ]; then
    echo "$website is UP" | tee -a "$log_file"
  else
    echo "$website is DOWN" | tee -a "$log_file"
  fi
done

echo "Результати перевірки записано у файл $log_file"