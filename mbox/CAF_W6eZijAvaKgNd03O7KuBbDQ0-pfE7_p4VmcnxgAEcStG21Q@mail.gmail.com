Return-Path: <carlosmaniero@gmail.com>
Delivered-To: carlos@maniero.me
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by uk-fast-smtpin6.hostinger.io (mx.hostinger.com) with ESMTPS id 4ZrQj435pJz9ttDx
	for <carlos@maniero.me>; Mon, 05 May 2025 02:39:36 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=maniero.me;
	s=hostingermail1; t=1746412776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=6+aHBQmnia3g7D7tFJn5D1FtltfvM7gWpof8ayuiNEI=;
	b=OnzQysabWRHRWpYyuAFwigIeFPKedrwuVG/n5tULAqWPo4SclxSNXuUhSjndgHVZ7oHGRH
	0d0ZP79VGIhORl1+3LqwFtj1GgY6svz6R97cieUzTqBPCUTzjmPL91bFPBOyK71CK0n1DU
	RcFpMDElsQ0+Q075eLRUc8vL0yDPMu/oiLvQDKzkzYATCJghDLt358A5OEDP2iXzvV56et
	dyEWcSipEoGI3n/p1dKgWAYLFvy+WT8B4BjcSABnTZTfvojTmKuo7h+QL4IhkIP6/3ggYe
	5mH3nF880aFZ5d83XmKoVMnBnVq8cqqZ9cXjcXYYnLbeU6GrxhvLyt4fZ0R5cw==
ARC-Seal: i=1; s=hostingermail1; d=maniero.me; t=1746412776; a=rsa-sha256;
	cv=none;
	b=hkB+VobSwYvz5J+VYSzM2zKBN/lgqSYV3mUpE27Ttx5szVm/XAPPMicY6IRS96Zmp1eyPk
	/SRedO/H6l1Y6SF9GbuPFpQ4xILV6YBgFqXkI8Njoq7fkC7BMo3YqO2XyPenk5MO9w0Qiy
	99nNqSGyK0QbJuDLCr+wsFJsRuLM3caMM1kntfVX6BzJolSePrgtpquRz/wcpxDYVopMDB
	up+gYGj3Cq8Gs3vRXvySqSGZJy526Qu+uBjvTQUWqFL6QFpULXiepvUj3DnmcDwt+HiXAH
	mgF72CV1N9Q0lDMZaHw1j19Zlz70ky0kcOjCtVDJzCxZSBjhIpTnqaxwPUX7qA==
ARC-Authentication-Results: i=1;
	uk-fast-smtpin6.hostinger.io;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=KIdC345c;
	spf=pass (uk-fast-smtpin6.hostinger.io: domain of carlosmaniero@gmail.com designates 2a00:1450:4864:20::62d as permitted sender) smtp.mailfrom=carlosmaniero@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ac2c663a3daso769654166b.2
        for <carlos@maniero.me>; Sun, 04 May 2025 19:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746412775; x=1747017575; darn=maniero.me;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6+aHBQmnia3g7D7tFJn5D1FtltfvM7gWpof8ayuiNEI=;
        b=KIdC345clcyDNUrGLr+roIAKNpTFIyxszBqoAtgqBGbeSTOMP52cf/vF6ud8gnB4eU
         rPp1WpwaWST5AuVcc4WK2nsmjzU41CG38sTFDhwBDNPiHdN6XCN0oQp4McEYTCaq37v8
         45zomx/Qyl++zXksKIxpEcnYjrf5Co5LUAYhTIurGL26DU6xSILjROWdchOrHW+NLEtt
         CFH8XV/PqqWk+UEC6Q+ReAzi4w9SVjjWHG0ZaL7QQGVlUE2SCEv50cQrX5NWCxalVFvv
         x/RfgDSrcl9KDOyYtKfPV63D64+w0POGal26d6fooRV6tViSO6SsIThYDcanODwgaXAm
         dZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746412775; x=1747017575;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6+aHBQmnia3g7D7tFJn5D1FtltfvM7gWpof8ayuiNEI=;
        b=vjTur+pN2HfpPZsDLyJlpde7lJ1MFlrWffL2Lsz3XajFLtutJxWfCjxmYvjmIryhK4
         8SZdolufy0ZopaGHLeGxDWw/vZTTiQutWNbFN8GFj6Uvi/MR+48PQM6AAD4UCevmg9CC
         BS8ddOnfQyAiFsSyZBOx+IZAlLTHzieBp0rMx/brf4hHS6c+FVG4RUkg3KYp0iW+EbWU
         VN2+XzRrCB+8CLTX8nwF+H3wWiXWvDPGQipO+RKEajgyq6UJRjcypmYnLH9WbHtIq51Y
         5d8eE1161JT3S+RcT7Li4TXtYSYqII0IwhGdspomxNpQlZDmr+I8B9+yMgCumv1Telki
         fXTA==
X-Gm-Message-State: AOJu0YyarCHbsaZ//jq43O7Bz/SLbcs1NjB+RyRpDhckPOuXMrCImPjg
	Smmh1hoYhj+TxoV4xO+/BjOW0JWFr7gp1HZvfh0Jxls/AUcXn0p3twld9I//i7JEWA2yB6CNseG
	AGHTl6b2HQGPic6DTIVI4liT7s7PMKQ==
X-Gm-Gg: ASbGncsIDb3Lg5xXrYxxu8Rqu7PRQqhV8882IvmnI3ATyyeTsrNc5cSQCkMVVlwrFsF
	s7QhjaqbNbInBPusfhyDRxvaBf3LnRVz9bwl+Gr1FaeDOBM88NiuoYOGIZaYkyk9TZjjG9vYoAD
	DODZa2EVw43q5kEpGXEtPG
X-Google-Smtp-Source: AGHT+IEOGw3sdrCB6V85cKXfX9LleD6Q8QlwGz/Fl5VGxZ+iTwrZ/DO/wiEMkJVX3Hb37kLdauaFiDVeHpnYIFWHUz8=
X-Received: by 2002:a17:907:d1c:b0:acb:b267:436b with SMTP id
 a640c23a62f3a-ad1a496cf52mr492838266b.25.1746412774755; Sun, 04 May 2025
 19:39:34 -0700 (PDT)
MIME-Version: 1.0
From: Carlos Maniero <carlosmaniero@gmail.com>
Date: Sun, 4 May 2025 23:39:22 -0300
X-Gm-Features: ATxdqUHu77_fbRVlG5QqXy5bKfJXYDBja_3zZ0AMo6BmgPLAhlgKfytjQ2awjW0
Message-ID: <CAF_W6eZijAvaKgNd03O7KuBbDQ0-pfE7_p4VmcnxgAEcStG21Q@mail.gmail.com>
Subject: blogpost: New blog
To: Carlos Maniero <carlos@maniero.me>
Content-Type: text/plain; charset="UTF-8"
X-CM-Envelope: MS4xfGAuRl9qx0Eu+JGO9OQbtwKNuR3pDQsWzlTv6bYAqqhgSst4Q4ibGtab5sudi2KeIbVDPOF3ilfaN4KmeYDnXQYGGs+4CwgWdp42byFbCZEyEqUIr+EU iOO7zk5cic1ZYi8vcHu37eit2pZk50leLGzHSKxRTDeOPyOKtBCftDsTOpG1Ddx19iSi8j/HqBrSr5WmBd8zMFSGfp9skttN8Mz5ZlGg3sAIP9l8WOFtuCYz
X-CM-Analysis: v=2.4 cv=IrhMc6/g c=1 sm=1 tr=0 ts=681824e8 a=UYnwgNuy4+9PapG5Rl6lPQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=x7bEGLp0ZPQA:10 a=hLGZJBIvmpkA:10 a=95EFz5htlIgA:10 a=ltgNZPbFm-qHBbeTJpUA:9 a=QEXdDO2ut3YA:10 a=Uz9EnhuHEG25YKoRyM-d:22 a=jMROYaktyPko46j5XlsI:22

Another comment to check if I can use the cron
