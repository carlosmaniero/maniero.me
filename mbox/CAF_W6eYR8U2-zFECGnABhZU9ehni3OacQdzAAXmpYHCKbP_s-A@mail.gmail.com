Return-Path: <carlosmaniero@gmail.com>
Delivered-To: carlos@maniero.me
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by uk-fast-smtpin11.hostinger.io (mx.hostinger.com) with ESMTPS id 4ZrF3C4v6Kz8ycCV
	for <carlos@maniero.me>; Sun, 04 May 2025 19:24:39 +0000 (UTC)
ARC-Seal: i=1; s=hostingermail1; d=maniero.me; t=1746386679; a=rsa-sha256;
	cv=none;
	b=bI8Diyrwx8ikvtD/rU9dblLDvgmNE34VzduNtlms+uURa6s1XXSR0+EcJL6N/fLwYrtiQY
	LqSlPIaXB2Dq2L8VSrKzBI/JjJTcWXsGGL5WILdkCvXHz1xvkwTwRVGYF2CTZh2yxEixcN
	jEbWgHtlIFSNWRcxpwbynkYeG/vyqr3G2i8I0Mhgv3NgTveg1CZgsXo90N8YjZKcaH1WFV
	2JndDlnAyTN3e01Qn7RC/lqSBP05htr30TiR3yU957yjOR6GGYjmoKRaHdEPz9XnETP7Wn
	CmQ4BP9imMssNSrWXron1fvFJ6bdVLccEhodDOCT5tgznP6jSGc8tewCw9W6dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=maniero.me;
	s=hostingermail1; t=1746386679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=mGl8EAdrZ+FBap19vpbjIWWsOVDnBbwsY7uqtjAoqp8=;
	b=RaiWN6HVNC/QBcBPROIVedof6gikbbBhIyou15U20Fq4Vfyhs9BTYXW+C6imQF29n/Ip2m
	TQGpPUlMsKMEQ87eo3mn2TYfivUM8G5NDRUPSJSK2vnvnMNuGb3ZOy3bO4WCXZI4nZyY6U
	vt36Xx3aoRTRn7tOA51RlEbaKfAzcQzXQtDa8m1fsKwWX5o+GDC657DNORNVgJDfCxt5eX
	IuxLZTBOUd99ClqJd8mMZ1TI/sBA/j8U0kX6gvFOreJmSPNRbX6vgLBw4nf9uRVnoLCkvn
	2YIVzT5sBXfkOF+imjAGjJCbSoStBXoqHiDeTkyJ1b0M7s0XVYOKCipZaJoTJg==
ARC-Authentication-Results: i=1;
	uk-fast-smtpin11.hostinger.io;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Ju31uh+H;
	spf=pass (uk-fast-smtpin11.hostinger.io: domain of carlosmaniero@gmail.com designates 2a00:1450:4864:20::630 as permitted sender) smtp.mailfrom=carlosmaniero@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac289147833so701397766b.2
        for <carlos@maniero.me>; Sun, 04 May 2025 12:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746386678; x=1746991478; darn=maniero.me;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGl8EAdrZ+FBap19vpbjIWWsOVDnBbwsY7uqtjAoqp8=;
        b=Ju31uh+HI6Y3ae6SkKPHUprvHHjiKU0dHARBln2BgVGe4tles84WH/3iEcH6qomrXF
         Yz+eKIPVZTWhJTZXBhgDm+i4PF+lDrPI8qOaq0ANZpkPo+lg1zLMrj9BFczmDNz0MzM8
         Sh91ANWMZ+T7qtLPlYQw6vUpLsngZwhEHM21Ls0vHNXUfUErqy84bKqd0vYKX4n4NsGN
         bW9rUl1/RSHojFRNXgqIJmx7Smp3dQGn0drdMe/3hJ4UU9/scscRvGgbSGVYMSUqpgCX
         ojfT+HjGISpiQMpIHeHNFv5XHspw+NbsF3SypS8bsWzYeMY/8y1k9AGVpFM/a5W6mK95
         gEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746386678; x=1746991478;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGl8EAdrZ+FBap19vpbjIWWsOVDnBbwsY7uqtjAoqp8=;
        b=Qn1UYjoN/o7cAavcad5K2YlawyXCF2Jz1xUs8kHWj/8OUKeBh1TtxLExalLNtmZJFW
         cbVaY4EObrTkiK8eFr1Y8iy7ZOFHN4GeA0W0Ai5dcgq3PkRJpp4kZvwHquVB39P7oGQv
         gJHQb+wOA/Kw/qkB/Oz6mNVattHrsg3aTd+8yo4tokvTQ39xBuKnOz26O21Vsd4/OUXE
         KIZ3PFHzKp7k/kLSt6xTMp27SiVoAIsn9wAOvelyYiHCcMViEcDkTMeIMM4WyU/4XLLL
         6s5VpzY6+3lT2b3SiCTvlRRXTVdPe09YuTBOlNBCgjkQ8zdPAB2CYpykAQI4HSF/1Fow
         Px0w==
X-Gm-Message-State: AOJu0Ywmn/6Ji8kMrF6VIe9Fj+pJSHrkBnDJeHSndjDnvjy4Q/CnQBCz
	qOhnOypzHHGET6pZZh/mLUsdnGPfA0+PmEH3py1Sz9vmCQDgoWyqXfq43crsVa7QPbqgmdvWu7k
	hAp/L7/f79x+QgEujhBMZI/5rEY6vfw==
X-Gm-Gg: ASbGncs1N1t5mKuAKegPgnTHS2NeHqEjYJNLbZk0xKuvazt4s0dNKNz8f/Rv+BzhfXY
	hn8792RoDBBwmoiduyLYuEyDtVMGzYf688fZHBnxUqXtI30iCM9jppFu00DRP2RwBfXmkF8edA3
	v9IidIfwDDbaTOWZhjHEu6gjJfu+BkJOg=
X-Google-Smtp-Source: AGHT+IHDLM70hB8Lsw1m/vol4W8b/6pF1iURirzKiz+3/0ZQ+MyrKUGC6ZQLAMtMXEQRE8iIZrv/kYgsZ7LyzRlSYtc=
X-Received: by 2002:a17:907:3d90:b0:ace:9d35:64a9 with SMTP id
 a640c23a62f3a-ad1a4acf77emr444522666b.51.1746386678332; Sun, 04 May 2025
 12:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAF_W6ebjCZexjh78KYiB31uYEmSo+rPXPBnjQULNHxgGuL8U=w@mail.gmail.com>
 <520b3038c0ac01e9ee5a673b4691821a@maniero.me>
In-Reply-To: <520b3038c0ac01e9ee5a673b4691821a@maniero.me>
From: Carlos Maniero <carlosmaniero@gmail.com>
Date: Sun, 4 May 2025 16:24:26 -0300
X-Gm-Features: ATxdqUFlsnXRcBJ6GkGfIr6d_bQdhXutDV1MxRka8crBAvCUQu5Wr9eh5Cit21g
Message-ID: <CAF_W6eYR8U2-zFECGnABhZU9ehni3OacQdzAAXmpYHCKbP_s-A@mail.gmail.com>
Subject: Re: blogpost: New blog
To: carlos@maniero.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-Envelope: MS4xfISjNVw0TE+mnUgjD+Q5zfVa/nkmAYOvZwUw/zlsL2h4uX8punhl/vEY+FBQrppxqeFILV46yyIPYK9pFarsfvjZ5NCfFe1UfVH82gCPOsdXaGlquMsh kvQJm9Zp5Xhzobv7mgx+Lrb2bWwZQBNd+FZgh0sgNvPFsuPjYPiJS853I6OP1T9GDrPRW6T69zczuhtF4X+/muTYFSRF9XTgGqSFQfNnWl0iiRXJwWExMOW8
X-CM-Analysis: v=2.4 cv=IrhMc6/g c=1 sm=1 tr=0 ts=6817bef7 a=5iRrRhn7uruk+SLBkZWVPQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=x7bEGLp0ZPQA:10 a=hLGZJBIvmpkA:10 a=95EFz5htlIgA:10 a=1J6ssQQ5PAgAHDA3csgA:9 a=QEXdDO2ut3YA:10 a=sbyW6lxcIZUA:10 a=envsVmHf6Ju9RhcOVXq8:22 a=Uz9EnhuHEG25YKoRyM-d:22 a=jMROYaktyPko46j5XlsI:22

Thank you!

On Sun, May 4, 2025 at 2:34=E2=80=AFPM <carlos@maniero.me> wrote:
>
> > Hello, that's a test to check if it really works!
>
> Yeah! That's work fine.
