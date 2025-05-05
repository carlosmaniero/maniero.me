Return-Path: <carlosmaniero@gmail.com>
Delivered-To: carlos@maniero.me
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by fr-int-smtpin5.hostinger.io (mx.hostinger.com) with ESMTPS id 4ZrQSg6kKqzCS5bW
	for <carlos@maniero.me>; Mon, 05 May 2025 02:28:51 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=maniero.me;
	s=hostingermail1; t=1746412132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=G6Gb9izENx7HG3bf+JMK1Kl6Tb+/dAT6ggI5TAeFCA8=;
	b=iyW7s7+N9PMW22VcPDfetsai9n7znF03gCR4DdBCj2fLYh9J7UrnbgOUQDjFri9v0H7jL8
	DnTxjO5DVR4MimYAB0PWgmGUC60V9g+hN2Yihi5D3GaMCBoaQ0XcYZclmDnZErjxWLtQRS
	u0Ab7TCOAxnO4o4ohXbeTVMXqae3hW/rhTXewe0W/fMbiK+UG4MqGivJGsVOR+W376bM8Q
	+8efuYVloAGEUj7nUXtGQSR1w7svsxTMRa8XCbqVDx9pY/VbTblEIeoyXSstK9c/KaXxy+
	lkHdX1GP60DA9SSo1xKBeAIVJH6CzvJP51XR9ltSruZ3DxJt+E5JG5a8i4fjtg==
ARC-Seal: i=1; s=hostingermail1; d=maniero.me; t=1746412132; a=rsa-sha256;
	cv=none;
	b=l/d1eBecIy6zts3cClYfYeCXjjF6Pd74FNhCYkKApgknlU2CYFV6CUiNSqNFCpbP+r1FuU
	5DO0cbZNYAsrMdCsDdm9N6dwdLyR+lchRAFZkOrDEsD94smgqCE2O/4I5cNOV+uYmHQggH
	+pBnoXk6q4e98V8uai8fxihZlihKOolsPsvgZmg/Mls0FqP/wH8qt/pLW49NDnS9uOMOf8
	SqhjmoQ0ixEqs0S7sR+KfVnQTfGKTV//nErncvkkD+scM7hdWnx3LQqTO+FsivcG6zwDKc
	XaV9eKO05wfCkwlaEHiVqpbNVruoum50mj6px9cCgzrI3cJeiPLHOV4ROZBC1w==
ARC-Authentication-Results: i=1;
	fr-int-smtpin5.hostinger.io;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=G99e5Ktr;
	spf=pass (fr-int-smtpin5.hostinger.io: domain of carlosmaniero@gmail.com designates 2a00:1450:4864:20::62f as permitted sender) smtp.mailfrom=carlosmaniero@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac25d2b2354so586306166b.1
        for <carlos@maniero.me>; Sun, 04 May 2025 19:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746412131; x=1747016931; darn=maniero.me;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G6Gb9izENx7HG3bf+JMK1Kl6Tb+/dAT6ggI5TAeFCA8=;
        b=G99e5KtrgGAV5XUT/8RYqUzoIePsGIm+sed9SL6I0FEkqLYOyc+WyDdbO1brcVmBMB
         ZYJoO+WnodYD5zUtILzlcVkPKvMsb1u4mjjaNlWhPQJ2KNKjsyyR/5xu9t6lU95XCPiV
         QNHY8mKKDlfs/2tOkl9TxUFJI9rTTQ4k43QmFyGBUNiKfmTfAM7hrWgo7rH5MI33nB7e
         lcmLV61d3U/ZYO9RkJCBUVelnF/AsoyvUFLb4FGWAvH1m6EWtS/KmzAqLTIlK+dJ41y+
         7TDAQmv3rrET7wVS2JVMpmpf3O0YvthZw8IkYZu7A3/D6PjIEaRHsWe2DuKS7zVfcvRd
         8pbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746412131; x=1747016931;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G6Gb9izENx7HG3bf+JMK1Kl6Tb+/dAT6ggI5TAeFCA8=;
        b=T4OR7g32UbuBeJ8cf+4clc6a6aJPfHM5jnQy7ZPZiWnhm0VU7m4lP7SItRO+mgywb1
         pzMlXCO/5yYcUwnzf4SX+sw4FKcODImxElBM2kP+UPRS1Xe9sqQURWIscjHKWSCk0Lpj
         ZMOakyWLVyHBXQxRVD0DeKj8F8BhZw3MEKM7qZ1N+Hrsb/Q6ikoiriQBc+HbFTJSYRq5
         8hTRMo/mZqc1pmbSVjPPb7N77HNQSpy3+hC1dVj3GTE2EwvgYoDKtJlwXLGvyCMJTlLf
         kR2GVgI4kclWCeCwjwjXQZW1smuJ5aIkozkVEl1GDYbl+5tUZUoli3oxWFke6kkDsR35
         q2aw==
X-Gm-Message-State: AOJu0Yw2TF18nawLRzwhsG1ODXKcw8fAFd1NIzDZPeW7oCHq9V8QjoJl
	Z7RwyU66BTUPxEWTfSM5bCFeFDDk8DT2DdrYiyfDFN0+FXsTrbc1GGSd8a+b01RbV5swxOkmXB3
	Z9pp5WcadCTe9ZQQdYOswIeniJZ/2VA==
X-Gm-Gg: ASbGncutPeaRcMhLjDQpKsofcGHW7fpQcf0/bvGRXApZtP8kjvYkvYU2/m4FCxt5qas
	BWyF0MPdIguszS+CuUgH2w33hYixHqh0eDeMgqbftvZlGlUuCWjx8gOWlZ4gYtT5CjP8YvyE1jl
	dC19fvSZn+SGCj4T2qBlTn
X-Google-Smtp-Source: AGHT+IEWAv4QMqoRm1XP4yPYmiMFjK6SnUie9DLCibS9DigBfuCkfqMXxpkorX+u3qUNoJIw046n9TbEahqkFcOmF0w=
X-Received: by 2002:a17:906:794f:b0:abf:4b6e:e107 with SMTP id
 a640c23a62f3a-ad1a495a555mr578773966b.25.1746412130687; Sun, 04 May 2025
 19:28:50 -0700 (PDT)
MIME-Version: 1.0
From: Carlos Maniero <carlosmaniero@gmail.com>
Date: Sun, 4 May 2025 23:28:38 -0300
X-Gm-Features: ATxdqUHtWaiC6vET5qu8M60nY0nIM8LQIZ9-F3mkwMlLViB_w72hBGXntN73YDc
Message-ID: <CAF_W6ea07e+98jA4LU910cuFKftVZENBQ_0T7tmy=gq549HUQw@mail.gmail.com>
Subject: blogpost: New blog
To: Carlos Maniero <carlos@maniero.me>
Content-Type: text/plain; charset="UTF-8"
X-CM-Analysis: v=2.4 cv=Vv1xAP2n c=1 sm=1 tr=0 ts=68182264 a=rbpJUjsIHgOjcJTXqDv+Xw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=x7bEGLp0ZPQA:10 a=hLGZJBIvmpkA:10 a=95EFz5htlIgA:10 a=fniMo1Jo0zvJbJXNvOsA:9 a=QEXdDO2ut3YA:10 a=Uz9EnhuHEG25YKoRyM-d:22 a=jMROYaktyPko46j5XlsI:22
X-CM-Envelope: MS4xfKHJQwkW5xwz5CNNHwdcw+G5EltDA/kWSomZsmwLEJCVt3lMugm+eP14lPJRuOSgfnNzVAqDRqlBFoBnTQUBxHfArEKs+DUZutEjuqDbyyepfid0l76c YS0LedEYPH+1L7nNy2r5bc9EhcDymsOCAIxvqQtG1dt+GFdwhbE8CBzuuu9cVTiqDVaZ08PrvHFLyO9cKuOaMWhOsXLBmojFHucoILNFZlXs/sTHc7LUDAAX

A production test!
