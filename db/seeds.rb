unless Slogan.first.present?
  Slogan.create(content: "{vi: 'For your sleep, for your soul', en: 'For your sleep, for your soul'}")
end
unless HotelOverview.first.present?
  HotelOverview.create([
    {title: "{vi: 'Spa & Massage', en: 'Spa & Massage'}", content: "{vi: '', en: ''}", post_type: "spa-and-massage"},
    {title: "{vi: 'Bar & cà phê', en: 'Bar & cà phê'}", content: "{vi: '', en: ''}", post_type: "bar-and-coffee"},
    {title: "{vi: 'VIHOTEL - KHÁCH SẠN VĨNH HOÀNG', en: 'VIHOTEL - KHÁCH SẠN VĨNH HOÀNG'}", content: "{vi: '', en: ''}", post_type: "hotel-overview"},
    {title: "{vi: 'Nhà hàng', en: 'Nhà hàng'}", content: "{vi: '', en: ''}", post_type: "restaurant"},
    {title: "{vi: 'Bể bơi', en: 'Bể bơi'}", content: "{vi: '', en: ''}", post_type: "pool"}
  ])
end
unless Information.first.present?
  Information.create(address: "125 Trương Pháp, Đồng Hới, Quảng Bình", phone: "02323 826 568", mobile: "0914 465 366", fax: "02323 827 568", email: "sales@vihotelquangbinh.com", youtube: "https://www.youtube.com/channel/UCKLZcGIzFVbjr4beDbPiVlQ")
end