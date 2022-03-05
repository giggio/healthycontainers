docker rm -f healthy
docker rm -f unhealthy
docker rm -f nohealthinfo

docker run -d --name healthy   --health-interval 3s --health-timeout 2s `
  --health-start-period 1ms --health-cmd "cmd /c exit 0" -t mcr.microsoft.com/windows/nanoserver:ltsc2022 cmd /c pause
docker run -d --name unhealthy --health-interval 1s --health-timeout 1ms --health-retries 1 `
  --health-start-period 1ms --health-cmd "cmd /c exit 1" -t mcr.microsoft.com/windows/nanoserver:ltsc2022 cmd /c pause
docker run -d --name nohealthinfo -t mcr.microsoft.com/windows/nanoserver:ltsc2022 cmd /c pause
