<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PdfViewer.aspx.cs" Inherits="PdfViewer" %>

<!DOCTYPE html>
<html dir="rtl" lang="ar">
<head runat="server">
    <meta charset="utf-8" />
    <title>عارض القرارات</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            font-family: 'Segoe UI', Tahoma, Arial, sans-serif;
            background-color: #525659;
            overflow-x: hidden;
            height: 100%;
        }

        /* Toolbar */
        #toolbar {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 48px;
            background: linear-gradient(180deg, #474a4e, #3a3d41);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 15px;
            z-index: 2000;
            box-shadow: 0 2px 8px rgba(0,0,0,0.4);
            color: #fff;
        }

            #toolbar .group {
                display: flex;
                align-items: center;
                gap: 8px;
            }

            #toolbar button {
                background: #6b6f74;
                border: none;
                color: white;
                padding: 6px 14px;
                cursor: pointer;
                border-radius: 4px;
                font-size: 13px;
                transition: background 0.2s;
            }

                #toolbar button:hover {
                    background: #8a8e94;
                }

            #toolbar .title {
                font-size: 14px;
                font-weight: bold;
                max-width: 400px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }

        #viewerContainer {
            position: absolute;
            top: 48px;
            left: 0;
            right: 0;
            bottom: 0;
            overflow: auto;
        }

        #viewer {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 15px 0;
        }

        .pdf-page {
            position: relative;
            margin: 8px auto;
            background: white;
            box-shadow: 0 0 12px rgba(0,0,0,0.4);
            overflow: hidden;
        }

            .pdf-page canvas {
                display: block;
            }

        /* ===== WATERMARK OVERLAY ===== */
        .watermark-layer {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 10;
            overflow: hidden;
            user-select: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
        }

        .watermark-tile {
            position: absolute;
           /* color: rgba(220, 30, 30, 0.22);*/
            color: rgba(224, 224, 224, 0.22);
            font-size: 18px;
            font-weight: 700;
            font-family: 'Courier New', monospace;
            transform: rotate(-35deg);
            white-space: nowrap;
            letter-spacing: 1px;
            text-shadow: 0 0 2px rgba(0,0,0,0.1);
            pointer-events: none;
        }

        .watermark-center {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(-35deg);
            /*color: rgba(200, 0, 0, 0.35);*/
            color: rgba(224, 224, 224, 0.22);
            font-size: 32px;
            font-weight: 900;
            /*font-family: 'Courier New', monospace;*/
            font-family:Arial,'Times New Roman',Tahoma;
            white-space: nowrap;
            pointer-events: none;
            text-shadow: 0 0 3px rgba(0,0,0,0.2);
        }

        .watermark-footer {
            position: absolute;
            bottom: 6px;
            left: 0;
            right: 0;
            text-align: center;
            color: rgba(180, 0, 0, 0.55);
            font-size: 11px;
            font-weight: bold;
            font-family: 'Courier New', monospace;
            pointer-events: none;
        }

        /* ===== PRINT STYLES ===== */
        @media print {
            @page {
                margin: 0;
            }

            body {
                background: white;
            }

            #toolbar {
                display: none !important;
            }

            #viewerContainer {
                position: static;
                overflow: visible;
            }

            #viewer {
                padding: 0;
            }

            .pdf-page {
                box-shadow: none;
                margin: 0;
                page-break-after: always;
                page-break-inside: avoid;
            }

                .pdf-page:last-child {
                    page-break-after: auto;
                }

            .watermark-layer,
            .watermark-tile,
            .watermark-center,
            .watermark-footer {
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
                color-adjust: exact !important;
            }

            .watermark-tile {
                color: rgba(220, 30, 30, 0.30) !important;
            }

            .watermark-center {
                color: rgba(200, 0, 0, 0.45) !important;
            }

            .watermark-footer {
                color: rgba(180, 0, 0, 0.70) !important;
            }
        }

        /* Loading */
        #loading {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 18px;
            z-index: 3000;
        }

        .spinner {
            display: inline-block;
            width: 30px;
            height: 30px;
            border: 4px solid rgba(255,255,255,0.3);
            border-top-color: #fff;
            border-radius: 50%;
            animation: spin 0.8s linear infinite;
            margin-right: 10px;
            vertical-align: middle;
        }

        @keyframes spin {
            to {
                transform: rotate(360deg);
            }
        }
    </style>
</head>
<body oncontextmenu="return false;">
    <form id="form1" runat="server">
        <div id="toolbar">
            <div class="group">
                <button type="button" onclick="zoomOut()" title="تصغير">−</button>
                <span id="zoomLevel">100%</span>
                <button type="button" onclick="zoomIn()" title="تكبير">+</button>
            </div>
            <div class="title" id="docTitle">جاري التحميل...</div>
            <div class="group">
                <span>صفحة: <span id="pageNum">-</span> / <span id="pageCount">-</span></span>
                <button type="button" onclick="window.print()" title="طباعة">🖨️ طباعة</button>
            </div>
        </div>

        <div id="loading">جاري تحميل المستند <span class="spinner"></span></div>

        <div id="viewerContainer">
            <div id="viewer"></div>
        </div>

        <!-- Hidden fields -->
        <asp:HiddenField ID="hfPdfUrl" runat="server" />
        <asp:HiddenField ID="hfUserSid" runat="server" />
        <asp:HiddenField ID="hfUserName" runat="server" />
        <asp:HiddenField ID="hfDocTitle" runat="server" />
    </form>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js"></script>
    <script>
        pdfjsLib.GlobalWorkerOptions.workerSrc =
            'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js';

        let pdfDoc = null;
        let scale = 1.3;
        const MIN_SCALE = 0.5;
        const MAX_SCALE = 3.0;
        const BASE_SCALE = 1.3;

        // Read server values
        const pdfUrl = document.getElementById('<%= hfPdfUrl.ClientID %>').value;
        const userSid = document.getElementById('<%= hfUserSid.ClientID %>').value;
        const userName = document.getElementById('<%= hfUserName.ClientID %>').value;
        const docTitle = document.getElementById('<%= hfDocTitle.ClientID %>').value;

        document.getElementById('docTitle').textContent = docTitle || 'مستند';
        document.title = (docTitle || 'عارض القرارات') + ' - ' + userName;

        // Build watermark text
        const now = new Date();
        const timestamp = now.toLocaleString('en-GB');
        const shortSid = userSid.length > 30 ? userSid.substring(userSid.length - 20) : userSid;
        const wmText = 'SID:' + shortSid;
      /*  const wmFull = 'SID: ' + userSid + '  |  ' + userName + '  |  ' + timestamp;*/

        // ===== Render PDF =====
        function renderPdf() {
            pdfjsLib.getDocument(pdfUrl).promise.then(function (pdf) {
                pdfDoc = pdf;
                document.getElementById('loading').style.display = 'none';
                document.getElementById('pageCount').textContent = pdf.numPages;

                const viewer = document.getElementById('viewer');
                viewer.innerHTML = '';

                for (let i = 1; i <= pdf.numPages; i++) {
                    renderPage(pdf, i, viewer);
                }
            }).catch(function (err) {
                document.getElementById('loading').innerHTML =
                    '<span style="color:#ff6b6b">خطأ في تحميل المستند</span>';
                console.error(err);
            });
        }

        function renderPage(pdf, num, container) {
            pdf.getPage(num).then(function (page) {
                const viewport = page.getViewport({ scale: scale });

                const pageDiv = document.createElement('div');
                pageDiv.className = 'pdf-page';
                pageDiv.setAttribute('data-page', num);
                pageDiv.style.width = viewport.width + 'px';
                pageDiv.style.height = viewport.height + 'px';

                const canvas = document.createElement('canvas');
                const ctx = canvas.getContext('2d');
                canvas.width = viewport.width;
                canvas.height = viewport.height;
                pageDiv.appendChild(canvas);

                pageDiv.appendChild(buildWatermarkLayer(viewport.width, viewport.height));

                container.appendChild(pageDiv);

                page.render({ canvasContext: ctx, viewport: viewport });
            });
        }

        // ===== Build watermark layer =====
        function buildWatermarkLayer(w, h) {
            const layer = document.createElement('div');
            layer.className = 'watermark-layer';

            const tileSpacingX = 320;
            const tileSpacingY = 180;
            for (let y = -50; y < h + 100; y += tileSpacingY) {
                for (let x = -150; x < w + 200; x += tileSpacingX) {
                    const t = document.createElement('div');
                    t.className = 'watermark-tile';
                    t.textContent = wmText;
                    t.style.left = x + 'px';
                    t.style.top = y + 'px';
                    layer.appendChild(t);
                }
            }

            const center = document.createElement('div');
            center.className = 'watermark-center';
            /* center.textContent = wmText;*/
            center.textContent = 'غير مسموح بالتصوير أو التداول خارج الهيئة';
            layer.appendChild(center);

            const footer = document.createElement('div');
            footer.className = 'watermark-footer';
           // footer.textContent = wmFull;
            layer.appendChild(footer);

            return layer;
        }

        // ===== Zoom =====
        function zoomIn() { changeScale(0.2); }
        function zoomOut() { changeScale(-0.2); }
        function changeScale(delta) {
            const newScale = Math.min(MAX_SCALE, Math.max(MIN_SCALE, scale + delta));
            if (newScale === scale) return;
            scale = newScale;
            document.getElementById('zoomLevel').textContent = Math.round((scale / BASE_SCALE) * 100) + '%';
            renderPdf();
        }

        // ===== Track current page on scroll =====
        document.addEventListener('DOMContentLoaded', function () {
            const container = document.getElementById('viewerContainer');
            container.addEventListener('scroll', function () {
                const pages = document.querySelectorAll('.pdf-page');
                const rect = container.getBoundingClientRect();
                const center = rect.top + rect.height / 2;
                let current = 1;
                pages.forEach(function (p) {
                    const pr = p.getBoundingClientRect();
                    if (pr.top <= center && pr.bottom >= center) {
                        current = parseInt(p.getAttribute('data-page'));
                    }
                });
                document.getElementById('pageNum').textContent = current;
            });
        });

        // ===== Block save shortcuts =====
        document.addEventListener('keydown', function (e) {
            if (e.ctrlKey && (e.key === 's' || e.key === 'S')) { e.preventDefault(); return false; }
            if (e.ctrlKey && (e.key === 'u' || e.key === 'U')) { e.preventDefault(); return false; }
            if (e.key === 'F12') { e.preventDefault(); return false; }
            if (e.ctrlKey && e.shiftKey && (e.key === 'I' || e.key === 'i' || e.key === 'J' || e.key === 'j')) {
                e.preventDefault(); return false;
            }
        });

        // Start
        renderPdf();
    </script>
</body>
</html>