@echo off
echo === 免密登录初始化: centos ===
echo.
if not exist "%USERPROFILE%\.ssh\id_rsa" (
  echo 正在生成密钥对...
  "C:\Users\Administrator\Desktop\WinLinux集成管理工具\OpenSSH\ssh-keygen.exe" -t rsa -b 2048 -N "" -f "%USERPROFILE%\.ssh\id_rsa"
)
echo.
echo （密码已在剪贴板，提示处右键粘贴即可）
echo admin| clip
echo 下面会提示输入一次密码（就是 dsj_admin@192.168.1.13 的登录密码）：
type "%USERPROFILE%\.ssh\id_rsa.pub" | "C:\Users\Administrator\Desktop\WinLinux集成管理工具\OpenSSH\ssh.exe" -p 22 dsj_admin@192.168.1.13 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys && echo KEY-OK"
echo.
pause
