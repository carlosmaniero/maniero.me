Return-Path: <carlosmaniero@gmail.com>
Delivered-To: carlos@maniero.me
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by nl-srv-smtpin2.hostinger.io (mx.hostinger.com) with ESMTPS id 4ZryLY2Dchz1gn8J
	for <carlos@maniero.me>; Mon, 05 May 2025 23:25:25 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=maniero.me;
	s=hostingermail1; t=1746487525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=BBDPM/eKOpk7AkCRz+NYwrYuWJ7s9UaNQSSDgODnBzw=;
	b=ij3Y/FYkFzBrH4d9tMKhjOJ7zaR0gKIPC7ggoVkPaGQdHjnDPY0D/Yf5xL9YJLU7TkNXEv
	MCvdIeYDw9rxJWrDLu3K2X2bPfF/knjsQJVMplIrerWweeZ+XLW336D83pOQZNa4Ivy+4B
	ILoUreNZeCcSeda8G3sVrLC+hFHb+3nc0ota0qRCsra0mR0pKSC7fkssdCqo95aZQOcIc3
	WYSrAwB6G0zMqjEV+Kl5deHg+MqqT5yzoOeQMkCFk5mY/0lR/WuBKmi8dxM6ri1Q0VnNUA
	Po0aOgCvurrHMV7yr0FjI3c/ReKEaTwVaRyWzbWL5VgbkfEU1MW5tmdk4C7f0g==
ARC-Authentication-Results: i=1;
	nl-srv-smtpin2.hostinger.io;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=TLOm8euN;
	spf=pass (nl-srv-smtpin2.hostinger.io: domain of carlosmaniero@gmail.com designates 2a00:1450:4864:20::635 as permitted sender) smtp.mailfrom=carlosmaniero@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
ARC-Seal: i=1; s=hostingermail1; d=maniero.me; t=1746487525; a=rsa-sha256;
	cv=none;
	b=iHcxZkJA1Y1Ga0q/tGfgaDBTAr55SAnex06Ai68ZyGvNb58q2kOdXqsirgC2MHab+pN7AQ
	P79+CTiAb/RaiKYq3Zgmw7axVZSDvVkG0n9mJ8E+eIeso86xJJx/xYBae45SjuK81QDmcV
	COEk+4uian32W35kj2ydyeEVOtZsZkGqIvd4ia38LsAGnfT6RZxcmVa9npWlqdST92vnG1
	PwleIIShAdvo2R5Y8bRT0K8+9NBqhu0FJVkrIhzfFp0K3xYPd4uV/tfCtwTAROO9MJaHNX
	ZYX6gS4XLnk88fTrLalzJL3YYRU8TR5XtXmndLN2TAjyW6ZAP8RDB1Je/0JZSQ==
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so694331666b.0
        for <carlos@maniero.me>; Mon, 05 May 2025 16:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746487524; x=1747092324; darn=maniero.me;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BBDPM/eKOpk7AkCRz+NYwrYuWJ7s9UaNQSSDgODnBzw=;
        b=TLOm8euNkg+pJNuIwAX6aW/8XJ3OrO2JtJO7/9I1HcUb9qbXUEFFOOr6eEP7PszfoW
         rB84QloBJ2x7Gp3zU5/Hg6Lum+Fqvk5H0U/2MxjFCbhaK1VjQ/QxZaa5weNtRcSbz1Km
         dK40wm1zb1t/tMHYxZpcCHtgd5U9HoOS8zJozlQ6W8VCVaiD/RNAka0Icwq+PqEOSSo9
         jFbwFpEa25YRZSZmGRK7WxeFx83xbbHwvqVZgKyY/QHuF/Q9wrM7oD8Ij9Q8ypVw8qeG
         ijJqzOQQYlGRrZp4XSfoJ1kw+G/tIA2QR8Lch2C6InxyEjaaWZ9rOvXfofd0DALz+9JL
         mA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487524; x=1747092324;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BBDPM/eKOpk7AkCRz+NYwrYuWJ7s9UaNQSSDgODnBzw=;
        b=BTV6MQ2SEuZcNrBrUNzD2XqmGjWa6W7+s2K82VmTMxJJ3vx3O2nX7m4gqrXftgFE43
         MulkuqKnkI7diSov2IrJ2SrG+nh3m48zyJR2stsjg2nszV3kvjC29kAzGFlrb1IiirvP
         7YY7SpBxEBcZrliAhFBz9PzUMQocHdnVMViM/yUBNgSWtoklPdVA41dUgdykZMr5PAMX
         QcJyMiUgEIXjuH+yWKjvLppLBuqQlLomc6GzVp+QVaYrkJR7ETLEbC3QSS/eeCnB1X8O
         iw+Rw+VsWD6cxErJSyvifPW0Cd7XCPUxuWiCifFnDMejHzb7c2sFOeA6tV9roInUN8v2
         XImQ==
X-Gm-Message-State: AOJu0YxTKU7NRv4USqQkbydfAfepFEBquH+ZEWD91cFSr41WHrOf72qI
	NZLNBoO6z1ITjRZDhYs3xVRKBQlFsKleeG082GBQ3J3xnpD984ru55kBapP1/nS/RzNl3QXDi2O
	/R0TFNn1hVVQU67QNkW6DK6xOiIC6oA==
X-Gm-Gg: ASbGnctX86EgKzG6n59aK9nGETGtE0ta6FHmF3K1QG/Xqg2uxvXre4XCixVDdUriqvz
	x4i4wPy7wappzVu/SS0Xrz+8LJ3V++5E/xHZoRG0CSBaXURZ3BfJC5V5fn4jsrRb11qmXnmgpoZ
	UIGedzz9bZ3f7UKAWLkrpo
X-Google-Smtp-Source: AGHT+IHeG/L14UlHEh6CtPfUCUVfSRrBkuebnH9cuHJQYR0IxxVcWrMnFQ+ngCO/czXht4p7GrYXIsjnzBKhien/0pQ=
X-Received: by 2002:a17:907:6e93:b0:ac3:3e40:e182 with SMTP id
 a640c23a62f3a-ad1a48f45e3mr840710266b.19.1746487523518; Mon, 05 May 2025
 16:25:23 -0700 (PDT)
MIME-Version: 1.0
From: Carlos Maniero <carlosmaniero@gmail.com>
Date: Mon, 5 May 2025 20:25:12 -0300
X-Gm-Features: ATxdqUG0YA67UQ6juRVoNWB9wVZ1gQzn21-avMSMbHbPMs5IUfrrUs_D9zaZstM
Message-ID: <CAF_W6eYteLsurH0piSKsHrtR0k9b6YDrXA2aOki8ZyP1Dgd6-Q@mail.gmail.com>
Subject: blogpost: New blog
To: Carlos Maniero <carlos@maniero.me>
Content-Type: multipart/alternative; boundary="00000000000071aefa06346bd056"
X-CM-Analysis: v=2.4 cv=AoO83/9P c=1 sm=1 tr=0 ts=681948e5 a=LfdP9PHMVb2HpAWOFXDq8A==:617 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=x7bEGLp0ZPQA:10 a=hLGZJBIvmpkA:10 a=95EFz5htlIgA:10 a=S67C7v9OxHSNi105oL8A:9 a=QEXdDO2ut3YA:10 a=Uz9EnhuHEG25YKoRyM-d:22 a=jMROYaktyPko46j5XlsI:22
X-CM-Envelope: MS4xfGVkJ7dIlzfXxLL6i2CC8FPS0kfvOLD/AcTPubGi7pho0TWa0y6J3R0q8Xvfpekr5oy4ACecOzZ3YYSZZRFOlX6VXvgOo6fzIvay5sppGQmWURezTCCD kOSnF8mJ/E7pRZ3ikPkF+ybmUFTuLlyNRxUu/FFyDyNaXQxgiD23YhfJ6jec14poBoTj6Jqd8ojsjbvP6a4o2l9oUz5kcTsYorxzYJ+7ZoQoahkgXqXJxstF

--00000000000071aefa06346bd056
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sending a multipart email just to make a mess =F0=9F=98=82

--00000000000071aefa06346bd056
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sending a multipart email just to make a mess =F0=9F=98=
=82</div>

--00000000000071aefa06346bd056--
