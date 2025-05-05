Return-Path: <carlosmaniero@gmail.com>
Delivered-To: carlos@maniero.me
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by uk-fast-smtpin11.hostinger.io (mx.hostinger.com) with ESMTPS id 4ZrN6Q6wqRz8ycCj
	for <carlos@maniero.me>; Mon, 05 May 2025 00:42:54 +0000 (UTC)
ARC-Seal: i=1; s=hostingermail1; d=maniero.me; t=1746405775; a=rsa-sha256;
	cv=none;
	b=Kx/j9jPoTwJ3F5ZVjeredt+DAa+ccv0McCBICGrb9WJto3yAVMFUVZ+qvFEWpI1AQ2sHs4
	p2MsFPIfJ26dLTbbjivj30bwiiGrARZzlq9DcRIV9ifo5NelATvddvUjxpHhfslCS2OjPS
	iAbuCeQwHQKEmse2KWGd9ryyQwhH8+Pvzre8vwFt/g7Z1NlwdRyN1ijprel3Ufqt20wxr5
	LZAgWVLzge6QJNIYgDvQ1r2O7d7LczkmcZ6Pp8AQ55iTGMlElCfS2aUdJTLslEWUvsUD0G
	6mvW8KgRxyAL7nkbMSdUROzeM5uxzOVUEg3kJW18kOY+mdIQ0umCVHZcyOSfqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=maniero.me;
	s=hostingermail1; t=1746405775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=s8SxinkJ5Uz3wMQq8uQp7reksucxiJYsvsEf9+YYZGQ=;
	b=umt0gfzJQ65XyeGvF+v53f+kM0tx5LU0CQl5LOXHBWmr1lUZX9/iblKIeSeRr/LnC9Gbx1
	vUeutQEXYMPv7unBWl8Rpf0qIXTPA+T0LNSnq8R3hHncY3chNimTMNBnLwO3YjvPsWJj5q
	gEY3RPQlZXU1Tqsjx5Z4dERd8JxUPbD6qOXiuqFC8QKfTF51FDfWyZulCG7Kub4+xLANID
	1eZ1enVyxDaHWbq7rfalW6L7t9X+kRM3Ouf9usQNjrp/Kbt2gU7Gxf6xAJ+KIhvA1xOkKC
	sBHNeLI1y1eG2TTnJ2qCn7oeUp80//Y8FiE1FOx4T4s4m8v01TgD0vJI81sZlg==
ARC-Authentication-Results: i=1;
	uk-fast-smtpin11.hostinger.io;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=DXM0dKFE;
	spf=pass (uk-fast-smtpin11.hostinger.io: domain of carlosmaniero@gmail.com designates 2a00:1450:4864:20::62a as permitted sender) smtp.mailfrom=carlosmaniero@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-acb415dd8faso582219466b.2
        for <carlos@maniero.me>; Sun, 04 May 2025 17:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746405773; x=1747010573; darn=maniero.me;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s8SxinkJ5Uz3wMQq8uQp7reksucxiJYsvsEf9+YYZGQ=;
        b=DXM0dKFEW4MUi1ami5hYCWcPTV9coklDGKFt7s4iNcNki/d9rCMjM8vZQchobdJMQ1
         sNnsaZ03QtO4Zg+/cIeiKQzjHZIO30gdVZ5PIeOTz6VYJ73Oz1uKqkpFAqg0ZdozwxoT
         iuUI9DEhbANMFiuUNAHNU8Ztgfgaa+7lFNTI2MN99ohRiWlaiJtTXmFmbC21cbc5X57E
         UkmU8SNiAxog9LCLDy7JLDXu6FVz81l751w5PnTQEzyJsHJRzxMYSZ9LKVHKllMNciUu
         xlRdl8GLcOD6sBOpt8AX6rLfSGuHnbYQfvGJ7f9+o6A73Gi1HTl0iFJvw69lTQkowa7P
         P3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746405773; x=1747010573;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s8SxinkJ5Uz3wMQq8uQp7reksucxiJYsvsEf9+YYZGQ=;
        b=ouC5HpG+7F6FMmg+VieR1PA2R/IP5fzbisi2H3KwvEG23RHWBrbmQiUkTwApk+y1Fe
         h3X1Q2HtVUIo7pbM+Qct7RiMcWOU0s3DMXd5vPFEX0M4/d5+fRfdRfkfPvIxP9Op4fDm
         CPeEspImSvJm9vzCAOtFYKQPjGjZT0HbEx2I1T+FJB10QW1XUTGbc0/GEQ1LZp/T+In6
         ksXMLzWyCOn4bvt0+CVnptlTluqDiMD2YbW3IkwI5GA1jjK1nbYHhBW3tovm2E8NXd2+
         SvMZzP0yiAlIjhpvEwQs8bp/DYN+FumzVh3XEnQYcS5FXoZzOrAiBSeHNn2mKZNB2Xtd
         6NGQ==
X-Gm-Message-State: AOJu0YyrEJQ7FjDBpThLR3GIxPtik18NfRR0jWnY2QIfSQWxI5ZCXlEt
	+Ro7e94FTdDmn/YtZNyz5g5L9DuU+18qi2WNNCDLjO6NoYdZ2Iz1VihMdWQOWCeFfdogw+Ert/g
	yY9VI5R2FHlSr63NWI2T0Y+iUGJlDkw==
X-Gm-Gg: ASbGncu2sHCbf+Zu+3nNIFe+ouwV7OmN0w/pnvl9LSADwU0Xca5424e5LgHpaJoBOjd
	lkDhmwUtcFFKHZ7jn5JX05YetaehjQfK+l8EMVSqvRjLDc4q0kVh6WfTdW6XFOKpLVhPeHl+ZkR
	HabE0QvMoNRV/tOvbmm8iA
X-Google-Smtp-Source: AGHT+IHxRgt67JtA5VEA0MmVNM0y8mIgPIMBx4lXWCMLJrykZAsznhl8N+2Nf8KSTiJS3hZ+ijaVOFwDtIvv0alwkVU=
X-Received: by 2002:a17:907:9689:b0:ac3:48e4:f8bb with SMTP id
 a640c23a62f3a-ad1a4acb3c8mr452668566b.41.1746405773442; Sun, 04 May 2025
 17:42:53 -0700 (PDT)
MIME-Version: 1.0
From: Carlos Maniero <carlosmaniero@gmail.com>
Date: Sun, 4 May 2025 21:42:41 -0300
X-Gm-Features: ATxdqUHB1SaR4T9tYQUKgNMKYkI54WUU5XFsIOsnYHNCrcLJuQ267UWDGVJtwas
Message-ID: <CAF_W6eYUZtRzWXTzrPjt1RDqduE2YzSnNJO+q1ee=jEydatsaQ@mail.gmail.com>
Subject: blogpost: New blog
To: Carlos Maniero <carlos@maniero.me>
Content-Type: text/plain; charset="UTF-8"
X-CM-Envelope: MS4xfKWUcqpWEWLYVcpRVTyomNUE9bXpsueQK/CV7JgJ0K7fHL0oW5/zfaS5ut6zIY+9vKP+Pz9uO3h97xYxnmcLmv1ATQuSMnejB+BGJTTYOSIO7lpjmtCA r8Kw51EGOXGDP6P4j+gSBInZYxUC/WCk1qD5CKywlRV/UPDfGjSTXRLGfzeS4dL8uFgRUnqAf6XLT6ucmlG0oTs5IBU5Crn1sXLbQUPJeYlVsrHHZm3C//a9
X-CM-Analysis: v=2.4 cv=IrhMc6/g c=1 sm=1 tr=0 ts=6818098f a=vdxqcKsHBZmZlbHU00GI/Q==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=x7bEGLp0ZPQA:10 a=hLGZJBIvmpkA:10 a=95EFz5htlIgA:10 a=Fsqg2n1_HhyRvekpSaIA:9 a=QEXdDO2ut3YA:10 a=Uz9EnhuHEG25YKoRyM-d:22 a=jMROYaktyPko46j5XlsI:22

Very nice the comment mechanism!
