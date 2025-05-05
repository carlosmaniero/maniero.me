Return-Path: <carlosmaniero@gmail.com>
Delivered-To: carlos@maniero.me
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by nl-srv-smtpin9.hostinger.io (mx.hostinger.com) with ESMTPS id 4ZrB9x0klzz9v5FK
	for <carlos@maniero.me>; Sun, 04 May 2025 17:15:16 +0000 (UTC)
ARC-Seal: i=1; s=hostingermail1; d=maniero.me; t=1746378917; a=rsa-sha256;
	cv=none;
	b=uEWn2pE0owCiLcYTcd1uEyCNws6UooIvM71DL3oLfg969wbQfagT/VxRq2oLMTM9s4Nz4Z
	7uPLblK3tCBeUJ6ycERynHOYO2xPDie5BJLO91D9aKMy9+eUbxa5rq0E/daH+vwvzyO1TN
	t0uH/u25bT033v6oypWBaRQJYhafc8KYowfHQpUGsoHMESZ6gbsCE0tL+gDgRDHjPVG+uv
	eOm4L2JVt7mnJJQSKLUTXhcX9jOtB94z+u/ONWBx/QS/T+U4pzns7dKkN+IYymmu31xxSj
	r8/4LQ7xMDHg4M0HiDYRylS+VS7EMVZBiIeXvU/gkmrq7M3XS/+twTfXY0ykpw==
ARC-Authentication-Results: i=1;
	nl-srv-smtpin9.hostinger.io;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=ZpfXAmpm;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (nl-srv-smtpin9.hostinger.io: domain of carlosmaniero@gmail.com designates 2a00:1450:4864:20::52e as permitted sender) smtp.mailfrom=carlosmaniero@gmail.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=maniero.me;
	s=hostingermail1; t=1746378917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=kt1PuC+++QFE6qgU2X3tHIX1L28Ch3/nfGO5Hjjs4vY=;
	b=M2ciRB74kLyl/11dEHzkIE51u5HQQx1BeCqPtlYsroWeO18yaeexTMClj/JM/2NPvFJpOY
	9oZHWkHVmUSORCdT+znj+wtjS6RDNDuJnZK9VBBBei0q8HlefjlX5iRASj0FzI0g4yd6aj
	nnfsGEbG4uJL/1YSffroCYMYOVFf/CA2LXOF1st10tBiazZPxoqy+hk+LMpxBUFbo71yyB
	5e9EnSaZ6YKKEPQ5KSKwytSmUfJ5NPPBfBx4dQhZe0gPk+vnRd81F4o9OwWTfhPwXLtUQS
	ASEEyFp47GuSnPVJS4UpQSnG2st9dYj42FBOfcf/ZQb2u210avIyT4yhN5H0pA==
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5faaddb09feso2042726a12.2
        for <carlos@maniero.me>; Sun, 04 May 2025 10:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746378916; x=1746983716; darn=maniero.me;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kt1PuC+++QFE6qgU2X3tHIX1L28Ch3/nfGO5Hjjs4vY=;
        b=ZpfXAmpm8/lc5+0XDoxADDdOePFb74LJAgD1j11perDJ6PcEnzXGpVR/5pjydx9+IG
         iW6MOj9I1kzDRT2S0fuS//wrUgc6FvXnVbLxCUwJdqnaTAC93b/xvh80a4nva6T8PpLc
         YQWll5O4j7zVUqekadN33HkA1cuMWZ6QaSzwgc49BCWTMD9GSzIY1M1IscjZ1XPAU2dV
         XeVnNo91QcNSf1GIhdCuA/RNm5/9YN4Qwa1DWyJv3U/fk/kM76wdGApQQniaIO6BKX0w
         kGTCY4zCT6+nRNYO1spNrF4xMRb9IXuBCm+rVZLuB3XxQ17L3wtQGO/GGm6qVEgz2LKe
         NGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746378916; x=1746983716;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kt1PuC+++QFE6qgU2X3tHIX1L28Ch3/nfGO5Hjjs4vY=;
        b=lX+zgm9Wm/EbQp073IGQ+5oMI8weQtg0iHf2vEV4IxORqciNvOfztmFH/+FgBcap8h
         se6qmVimcvio2tZCSEzEd86aaTBm7vnDifOnNmrOuj1r7Hj9cknCbpfziw46Cow7ccZ9
         /KSE+121CDIWns/5nGOsfWMIQfr2ozHgj7N3gv2aaAO2wNatwB7KA0gUeEUhm++dnb3U
         T+WvLHaQtJeUFmhNYIOpymiC7V2fHOTCVNBTGcTyoSrqLEuQEyH3XO6u1kl2AxhlXR6l
         xAmtbBw45LJxLkB67DfCursgPAkGqLbTO1xKtr1gJsfabHh7CewkZ+WAwJXhVjz4z3nY
         BOnw==
X-Gm-Message-State: AOJu0YxltUuolE6aze1dV+fj19zrUcjnh7kBWm9b/YzJqw7CMKXB8NrZ
	iARKilfQoXpoVeUyw6L/0U2t3VCxZDI3Z047mas5/lNXiqlw5RGLhxcq1hqcmdInPH972d4wdte
	h+9KmH8QmYWhgpiklMN3V4+QSWDy9/g==
X-Gm-Gg: ASbGncu/p1Qhsk9zWiybfTAVHEsJULsN3WQVwpKpigEoOBZJfERTVJamNGGGBZRu098
	I6qcwe1jbfi7xplTMc1ysbC0YBoBNJ+iDDBbMb4/8pPlWUTnyaMlhqj+UuAWwwcwGE/Hrsww1Y2
	XsbyJiwEougw4HPAZSbxOc
X-Google-Smtp-Source: AGHT+IHfTkKQfDbags+IZbeXDN1e72wj4C5AtCtm3Ld0PcXVQWxsSsnKDc2js5hT0mA4ezSBk/CGzbW+B7KOcQkm5yY=
X-Received: by 2002:a17:907:6e94:b0:acf:8758:50f5 with SMTP id
 a640c23a62f3a-ad1a48bd704mr463931366b.5.1746378915403; Sun, 04 May 2025
 10:15:15 -0700 (PDT)
MIME-Version: 1.0
From: Carlos Maniero <carlosmaniero@gmail.com>
Date: Sun, 4 May 2025 14:15:03 -0300
X-Gm-Features: ATxdqUFtV-k6yuCLaE1P27GAEmQ2fHWMUfrcniCMRXaAAF-AUQtdZaTu05DuG-E
Message-ID: <CAF_W6ebjCZexjh78KYiB31uYEmSo+rPXPBnjQULNHxgGuL8U=w@mail.gmail.com>
Subject: blogpost: New blog
To: Carlos Maniero <carlos@maniero.me>
Content-Type: text/plain; charset="UTF-8"
X-CM-Analysis: v=2.4 cv=AoO83/9P c=1 sm=1 tr=0 ts=6817a0a5 a=jQGFHXrGwEQCvFnNPCkVkQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=x7bEGLp0ZPQA:10 a=hLGZJBIvmpkA:10 a=95EFz5htlIgA:10 a=5HVDvdsq3SOapyv32KMA:9 a=QEXdDO2ut3YA:10 a=Uz9EnhuHEG25YKoRyM-d:22 a=jMROYaktyPko46j5XlsI:22
X-CM-Envelope: MS4xfNDRJYb3knIGhzBAg0856wYIH028BLERApPQ3kk+SSIM+LGKE2qSY4iDeR9mKDc0pCvEIGYBAmMFwub4iK0hwlLgFNdLyzuno8bW69lYpEvczCTC5xhn yyVqLyibXfYXxD7yI9W6Z6Do8J2Fr7Zt4KVVBW96qm8c7ehlZKcthhW/ISVMYTeaKW0aP8zBXi2fDIu4qfVQqo9ZmHU0Fw1bxhj9vma7HZJgo1PTBgGmSGQH

Hello, that's a test to check if it really works!
