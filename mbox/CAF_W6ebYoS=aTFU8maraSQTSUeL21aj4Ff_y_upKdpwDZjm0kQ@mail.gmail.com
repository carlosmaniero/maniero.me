Return-Path: <carlosmaniero@gmail.com>
Delivered-To: carlos@maniero.me
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by uk-fast-smtpin11.hostinger.io (mx.hostinger.com) with ESMTPS id 4ZrRpf36VBz8ycCM
	for <carlos@maniero.me>; Mon, 05 May 2025 03:29:30 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=maniero.me;
	s=hostingermail1; t=1746415770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=oR3kydYHAORHe5w3AbRQKw3euE+c1+8UOK132YQbWbI=;
	b=aXu45vUmO0RZEQ3eP5RAVcFsomDHLWqVnwSulZQja5DGg3IXM0aOdujwIcLJtSZmLN4GnS
	piA66XFEv4j1JQvCCCAz0I9AJkycAsncNl2PjWANE7kYZ0DbaxXmHw9qiofjYGu/tWSYml
	0vwguomHUqybMCZV/IoceNnh4UBah5GPlwIm681v6LG5CgbXxKmUA3aRX+rN3hETs5oXSP
	Vf1ujyWaFW0UTShj3GKhavPtZ+r7HcwCugKY0GQm9k+jeHEarrbLOtwQfuVWkN7megCvwv
	xLIptqC1FE1VLWAthhgmwX3cjcmKcMvxM6EcwattMhbxWiAIzuT2WqXsKbtKIg==
ARC-Seal: i=1; s=hostingermail1; d=maniero.me; t=1746415770; a=rsa-sha256;
	cv=none;
	b=JieTO2JVrtxwTp6qqQv8QBnAAFqMIKDlQSPZ+4nY/grtPv7YQnNgzM87LCnkL85aDYFICU
	nbutu8nLcvV5rTJInkm/cLy+oWUqOzVqx+Nf7XxbzrOpjRE1QxLPq6nRj1RPjpvCY9DIWB
	gpK18IPD4pi4GFGxTzIjDZyQRgqTkx55XYKRcih0QcjSlr15XOX9ZN5l43ppA94aUEDQdb
	jFFDcDBYrarGycaa3vej1DLuZkOjstEr9gurRrgn1SGw7xF/3B7lscKVepSLsDv5c7AicS
	9TIEjCO2u6ZH+7uhG9hNIGdyzA+2kNfD+FOIef0jTvAkjSCOWi+5wQRGfwAyJw==
ARC-Authentication-Results: i=1;
	uk-fast-smtpin11.hostinger.io;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=W+1PXtri;
	spf=pass (uk-fast-smtpin11.hostinger.io: domain of carlosmaniero@gmail.com designates 2a00:1450:4864:20::62a as permitted sender) smtp.mailfrom=carlosmaniero@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so527262966b.1
        for <carlos@maniero.me>; Sun, 04 May 2025 20:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746415769; x=1747020569; darn=maniero.me;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oR3kydYHAORHe5w3AbRQKw3euE+c1+8UOK132YQbWbI=;
        b=W+1PXtri6u+Cf0+0R75FCRkFc7eW/kLK2KVk0pTQFLcSAxl1i97C2De+jAj9i/4dGd
         C1ZzI83vD9PouEXc2g1eExBVCnWXWvbn23yLj4N4lNaRFfLAL0G31ypbA5NNo9sDtUzx
         ze7RBp7TDnXXwjrH9XYSHTEYSZwmTvBgapawVS80fOx+t09S/kW+AZ02xUvAOmpJmS3P
         hSZxvszxBY8018QqSvHczViJXyivPQYDrDBXugtY9bYnqcdKcYYY4iF90JG1T0YC9ya4
         BW+GhaAV8Jymrhyr8tiKRvfMQL9zdx4iNZBZgTL4WzDYRjQN26pjSNWy2IKcAQnpAmew
         sFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746415769; x=1747020569;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oR3kydYHAORHe5w3AbRQKw3euE+c1+8UOK132YQbWbI=;
        b=tN8soN53Zi5H5Si4s4LGxoXnIec7lsz2YxCmLbFiVjPbj0X9hyrqt25d06BhZGOYzW
         YH6xJGyXP5YNH8wRUH4mtLtArje8864MbH2atzVjcWVRyhnRbWoLx7Vlw5O8xIfhphzX
         BmzzoYd4d6kPwFBv/KGWGB4UyiBLMrxH5uZDhgCuXU2eF4D3zaqlmxs+LkRd5+AQdsqA
         ZgHgvX7hZskxba/TewUN3iz+sShpXh+0g5zpbGMyabajyj+X8HZeti31yLBpQ91QCK8/
         vEI9MH5xBCcH1XONlflxzn6glUCwBF+QukBaMks9suEQDECnwLol0R3Qrchkc0tBqrFK
         GnWw==
X-Gm-Message-State: AOJu0YyAK2RvJb6beee+QjnDqckSd52/JS0hQU5HtUXIlzkI3Yam6RkK
	JsP4Y2vuSsYUCYTHSzzg6tHkvYxgIKmkksAPugP+Q+dArzB7MNks88Fz7aphCQ2+7UzBEwHEZ3h
	Ls4/Gt7uENGX4b3vwUYwF8qeoTHxu4g==
X-Gm-Gg: ASbGncsi2ytWBfpoNOmXJqXZYRbxqRF/BCd/7r5D/eoR1MVHyJTzL5h4EiqyNsgAp3E
	au8vHvFvDyyraVIfEquz7zQtKh2rrtdl0Xhimk1NL6RMLq19k8s73wbhCb2WpnJdWt6xTutvZUj
	G0y9Ls+iRFWhbDHoukJ08G
X-Google-Smtp-Source: AGHT+IFuOSQs/YeO4bTZAgeGPMTAnPIDswSipCVsgLkPF2ZfXI91dy5nDUmKMhpSJQ4r9ASqPcVoO1HMpVwmzjvuvAQ=
X-Received: by 2002:a17:906:bf48:b0:ace:4197:9ac5 with SMTP id
 a640c23a62f3a-ad1906a9acdmr715809766b.27.1746415768671; Sun, 04 May 2025
 20:29:28 -0700 (PDT)
MIME-Version: 1.0
From: Carlos Maniero <carlosmaniero@gmail.com>
Date: Mon, 5 May 2025 00:29:17 -0300
X-Gm-Features: ATxdqUEN4DQvplP5RwESZM43inj8YCIq82RZiEfYFy5mw9o3SK_OXEYomIZ4mOc
Message-ID: <CAF_W6ebYoS=aTFU8maraSQTSUeL21aj4Ff_y_upKdpwDZjm0kQ@mail.gmail.com>
Subject: blogpost: New blog
To: Carlos Maniero <carlos@maniero.me>
Content-Type: multipart/alternative; boundary="0000000000008598c906345b1bbb"
X-CM-Envelope: MS4xfG1FSZRy7zE6eFggy/3vnQKsYeRSn6LY+eESunO+B1FLx0ENQNeW/QviBmbMa/2LqAcflSN33vyhTWGVj5D5Rd714R2VzQptJa/UOEf1v2OTCc10GwJP Hjc9XrMZKqtnBSB7lffFkRft9rOorvWX+mA77M+CUvVONqcGwFfx/z07woUrNRNQeyVsxbfCFuW9Y+qdVSDqDhwWSBWKGScNwl4Rg060+F3KHggUvTnslaxs
X-CM-Analysis: v=2.4 cv=IrhMc6/g c=1 sm=1 tr=0 ts=6818309a a=vdxqcKsHBZmZlbHU00GI/Q==:617 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=x7bEGLp0ZPQA:10 a=hLGZJBIvmpkA:10 a=95EFz5htlIgA:10 a=jPczo5qxjAis1zvTvwYA:9 a=QEXdDO2ut3YA:10 a=Uz9EnhuHEG25YKoRyM-d:22 a=jMROYaktyPko46j5XlsI:22

--0000000000008598c906345b1bbb
Content-Type: text/plain; charset="UTF-8"

Testing from my mobile device.

--0000000000008598c906345b1bbb
Content-Type: text/html; charset="UTF-8"

<div dir="auto">Testing from my mobile device.</div>

--0000000000008598c906345b1bbb--
