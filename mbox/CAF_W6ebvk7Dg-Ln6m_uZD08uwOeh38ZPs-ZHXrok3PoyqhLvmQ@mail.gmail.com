Return-Path: <carlosmaniero@gmail.com>
Delivered-To: carlos@maniero.me
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by nl-srv-smtpin2.hostinger.io (mx.hostinger.com) with ESMTPS id 4ZrRhV4ZL0z1gn8G
	for <carlos@maniero.me>; Mon, 05 May 2025 03:24:10 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=maniero.me;
	s=hostingermail1; t=1746415450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=TpMYrBGZXvKkjK/eiUd18hVoUh2MarcbJVk45l1BIaM=;
	b=L7qRkFmokOqoLNrJrgrS1qcWljtXCSY1qEQPr8AQIRpzelTrQIfECcOIFh4QryW880rOY5
	4IwRgF2MWGKdBHhuz3ewddXJLPwLtx/H7u5b7RmJH8snHfVCjIJsB6kQPPEpqCrph3PVmY
	Ym2YPz+avmbJLls27oNCTA6ekpqlMu6MVh4GZRASP/ReSjbH9FfgLpxF83YhkWUi3K5Fvi
	pMcmTCKA3pxQmUyUIcTGK134b5qSunr12KBUFnDJ5olTTsY1lDonGpPnhR3CmfxlNlMgM6
	w5kVUp6cg4G6AwINOOfxZrRllmpPepubtKD5vnRfdr91BecLj+xUmhg5GiklPQ==
ARC-Authentication-Results: i=1;
	nl-srv-smtpin2.hostinger.io;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=TD2WwRiD;
	spf=pass (nl-srv-smtpin2.hostinger.io: domain of carlosmaniero@gmail.com designates 2a00:1450:4864:20::52a as permitted sender) smtp.mailfrom=carlosmaniero@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
ARC-Seal: i=1; s=hostingermail1; d=maniero.me; t=1746415450; a=rsa-sha256;
	cv=none;
	b=iKFHP6A11okwHGeb43FqEQ10k8GA3kjEfwln0O5n3rV7R4ZO+gnKZbuSIIykytT1PIJlW3
	zrBrNYuOIwDNF0HVDkkaL6CVf8QBNfKZ8sKbwJ4tulDQnV6VzrB8bg76lUdKfftTQneUcW
	la/NyNH6lTw2aF5PjG+3LXEOpJeVYLv2K5IX0n9m+Wswy8MU3M8AnvpS4mvteW2X2RbZPj
	e2+kesqGF2LY4ENElcEYN2rnS7Jsb3b5w1R3gSVqyW0YjHQaEhrZV0fm5tyJq6dlrJHmDR
	5gFhg1uod1f5nmNmofBr0F/TEvvvS5pvl2pk5vv1vuZPjzsGfNc2ohifBqKVAQ==
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so6077864a12.2
        for <carlos@maniero.me>; Sun, 04 May 2025 20:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746415449; x=1747020249; darn=maniero.me;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TpMYrBGZXvKkjK/eiUd18hVoUh2MarcbJVk45l1BIaM=;
        b=TD2WwRiDdtBC9H7zEUrKQ03baF500RZAGQ0etAi3AbNxzY6Xb1hGQL5R6om/JsgVw1
         MPCQ8dC7n88I1LNHi5ElUmNhXLD9kpDLgrIwfMud03iZdm94TvtdGefEBkai3q63mdXp
         fe1nPR8N6R6dTxg3ZJ+KRcxaedpWdZWmcEHO8mzR7dE3JgIQpKUV477RKPWLAjNxCA0K
         yPXoslFrOFaEHnyYDTQDWpQ9JQw1E0MKIkgLA/AfoPq+f181hugvsQa+miMvVreB3UMo
         WDrVVrZtEEApmmRi5bMCfFJZYHn//tNcWL/AWLZHt2PUegsfwEKINdW0xOnErnA+MvTA
         ZeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746415449; x=1747020249;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TpMYrBGZXvKkjK/eiUd18hVoUh2MarcbJVk45l1BIaM=;
        b=MxvSwt/lsDipkaNQiYQZjTLV/jf/mf+uVWUlb+0bDfenFy85Liv9EI9eRKdOs4n/Qy
         pwFJKu1YupOwgpgKBu4tLYtEJfTYu6MZtLxLUoA1jixVllNqpGbckSaLlEqlmBKMkB90
         vd+6zy7Bvbf0lrmYjpq2b9wVqu6lwe6s794OAz5WVeOupiPy56KBVbXNOF0GuAT7HHBh
         sN2H9wnOi9jJ+fNqXaqZBvihtOVXUnEbHv9ZQexvumSTx27iVFeHxdNWm2vb3ncCZ4Jb
         fmUw7EASFuYsrlEtSTW5On8d/waYZAurUN4lR5frOVsjlCJpG0we6cBRjbavwPyCWwE8
         6hgQ==
X-Gm-Message-State: AOJu0YwLxgGMU5PfrCr3aPb0ldZ2HhAJub/5U9MT0LxRh+jvrKrwGvcp
	GVcL9+ko5kpvCC6OWLcyk0T1Q9iDJd+AigLfCC5Z1VGwP4eKk6fXz/mZR5h/qTfc3AE1o7HfTsK
	Spc1j85/CaJ+w/HTPTb/9pdzbSbI79A==
X-Gm-Gg: ASbGncsXRyCusZD9Uh0CtPUC8rdK8oVubb1UxkuAxsLVVXsysqHzlvq8fn4OEVMhwvb
	CRHXyDJSGah1fmAEUH0Cv46Idxkj9F2ZXZYouy3vuWF7HEqvtYhRJ4eOb3Jo9yOgdelvQTs4VRR
	bG8vLMZawVkFl8JVzxOOR6
X-Google-Smtp-Source: AGHT+IHk6YJBlNiFsbYSgmR/kRV7LspEcHEh9aMMi1h4ChV5qd0uyPAI/vQBzdQHD3gkFUFpFJVrbSb/5Nm80rrjXfI=
X-Received: by 2002:a17:907:6e87:b0:ace:d828:9226 with SMTP id
 a640c23a62f3a-ad1a48bb914mr450705566b.10.1746415449361; Sun, 04 May 2025
 20:24:09 -0700 (PDT)
MIME-Version: 1.0
From: Carlos Maniero <carlosmaniero@gmail.com>
Date: Mon, 5 May 2025 00:23:56 -0300
X-Gm-Features: ATxdqUGYUj3EpHy13gCIRWYN_fKaEKfNyg0Yr6aQQzrbEGMyuIhXns-BK2woynI
Message-ID: <CAF_W6ebvk7Dg-Ln6m_uZD08uwOeh38ZPs-ZHXrok3PoyqhLvmQ@mail.gmail.com>
Subject: blogpost: New blog
To: Carlos Maniero <carlos@maniero.me>
Content-Type: text/plain; charset="UTF-8"
X-CM-Envelope: MS4xfEn8xJyA9m1T6f+PlY+AjyqeqxsSMwGCX22J+l3LHQH0EA4cVgqCmvl+IqwTWGquFD66PvTxUH/GAsvnVvasaMLP2vM8hTG/lxXieZ3jLsSxBU9bFoGq z0hheFXvL44YHCRYBSFWPWXR2wvGNu8GXnDLEnky8HLELds05kFf7DII51RqIh0hDd/Wt7eQcGDePxPKvqmKo4gA9BswfvL4ow+sMctUEhrugDG5fuBUwBo4
X-CM-Analysis: v=2.4 cv=AoO83/9P c=1 sm=1 tr=0 ts=68182f5a a=I2/ymj3agjSCzJf6OxfMBg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=x7bEGLp0ZPQA:10 a=hLGZJBIvmpkA:10 a=95EFz5htlIgA:10 a=epb7S88j7YRbv41HS-sA:9 a=QEXdDO2ut3YA:10 a=Uz9EnhuHEG25YKoRyM-d:22 a=jMROYaktyPko46j5XlsI:22

At the next github cron, this email will appear! \o/
